
# AKS Cluster
resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = "rangersapp-prod-aks"
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "rangersapp-prod"

  default_node_pool {
    name           = "prodpool"
    node_count     = 2
    vm_size        = "Standard_DS2_v2"
    vnet_subnet_id = var.aks_subnet_id
  }

  identity {
    type = "SystemAssigned"
  }

  role_based_access_control_enabled = true

  network_profile {
    network_plugin     = "azure"
    load_balancer_sku  = "standard"
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

# Assign the AcrPull role to the AKS cluster's managed identity
resource "azurerm_role_assignment" "acr_pull" {
  principal_id         = azurerm_kubernetes_cluster.aks_cluster.identity[0].principal_id
  role_definition_name = "AcrPull"
  scope                = azurerm_container_registry.acr.id
}
