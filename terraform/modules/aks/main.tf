
# AKS Cluster
resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = "rangersapp-prod-aks"
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "rangersapp-prod"

  default_node_pool {
    name           = "prodpool"
    node_count     = 1
    vm_size        = "Standard_B2s"
    vnet_subnet_id = var.aks_subnet_id
  }

  identity {
    type = "SystemAssigned"
  }

  role_based_access_control_enabled = true

  network_profile {
    network_plugin     = "azure"
    load_balancer_sku  = "basic"
    outbound_type      = "loadBalancer"
  }

  tags = {
    environment = "production"
    owner       = "Lewis"
  }
}


resource "azurerm_container_registry" "acr" {
  name                     = "rangersacr"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  sku                      = "Basic"
  admin_enabled            = false
}


# creates the data block to get the AKS cluster details
data "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = azurerm_kubernetes_cluster.aks_cluster.name
  resource_group_name = var.resource_group_name
  depends_on          = [azurerm_kubernetes_cluster.aks_cluster]
}

# Assign the AcrPull role to the AKS cluster's managed identity
resource "azurerm_role_assignment" "acr_pull" {
  principal_id         = data.azurerm_kubernetes_cluster.aks_cluster.kubelet_identity[0].object_id
  role_definition_name = "AcrPull"
  scope                = azurerm_container_registry.acr.id
}





# Assign the AcrPull role to the AKS cluster's managed identity
resource "azurerm_role_assignment" "acr_pull" {
  principal_id         = azurerm_kubernetes_cluster.aks_cluster.kubelet
  role_definition_name = "AcrPull"
  scope                = azurerm_container_registry.acr.id

  depends_on = [azurerm_kubernetes_cluster.aks_cluster]
}

