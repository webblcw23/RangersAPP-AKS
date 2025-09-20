# provider setup 
provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

# resource group
resource "azurerm_resource_group" "rangers_aks_rg" {
  name     = var.resource_group_name
  location = var.location
}


module "network" {
  source              = "./modules/network"
  location            = var.location
  resource_group_name = var.resource_group_name
  vnet_name           = "rangersapp-vnet"
  subnet_name         = "rangersapp-subnet"
  nsg_name            = "rangersapp-nsg"
  address_space       = ["10.0.0.0/16"]
  subnet_prefixes     = ["10.0.1.0/24"]
  aks_principal_id    = module.aks.aks_principal_id
}

module "aks" {
  source              = "./modules/aks"
    location            = var.location
    resource_group_name = var.resource_group_name
    dns_prefix          = "rangersapp-prod"
    node_count          = 2
    vm_size             = "Standard_DS2_v2"
    aks_subnet_id       = module.network.aks_subnet_id
    aks_cluster_name    = "rangersapp-prod-aks"
    acr_name            = var.acr_name
}

# To allow for the web app restart
resource "azurerm_role_assignment" "webapp_rbac" {
  principal_id         = "d0d5257b-bb1a-4272-b552-98a508458f5f" # Service Principle object ID used in ADO as service connection - 
  role_definition_name = "Contributor"
  scope                = "/subscriptions/91c0fe80-4528-4bf2-9796-5d0f2a250518/resourceGroups/rg-rangers-aks"

depends_on = [azurerm_resource_group.rangers_aks_rg]
}

