# provider setup 
provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}



# resource group for Prod AKS Env
resource "azurerm_resource_group" "rangers_aks_rg" {
  name     = var.resource_group_name_prod
  location = var.location
}

# resource group for Dev Web App Env 
resource "azurerm_resource_group" "rangers_webapp_dev_rg" {
  name     = var.resource_group_name_dev
  location = var.location
}


module "network" {
  source              = "./modules/network"
  location            = var.location
  resource_group_name = var.resource_group_name_prod
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
    resource_group_name = var.resource_group_name_prod
    dns_prefix          = "rangersapp-prod"
    node_count          = 2
    vm_size             = "Standard_DS2_v2"
    aks_subnet_id       = module.network.aks_subnet_id
    aks_cluster_name    = "rangersapp-prod-aks"
    acr_name            = var.acr_name
}

module "dev_webapp" {
  source                  = "./modules/dev_webapp"
    location                = var.location
    resource_group_name     = var.resource_group_name_dev
    image_name              = var.image_name
    image_tag               = var.image_tag
    acr_login_server        = module.aks.acr_login_server

}


# To allow for the web app restart
resource "azurerm_role_assignment" "webapp_rbac" {
  principal_id         = var.service_principal_id # Service Principle object ID used in ADO as service connection - 
  role_definition_name = "Contributor"
  scope                = "/subscriptions/91c0fe80-4528-4bf2-9796-5d0f2a250518/resourceGroups/rg-rangers-aks"

depends_on = [azurerm_resource_group.rangers_aks_rg]
}


# Storage to store and manage my tfstate files
resource "azurerm_storage_account" "tfstate" {
  name                     = "rangerstfstate"
  resource_group_name      = var.resource_group_name_prod
  location                 = "uksouth"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "tfstate" {
  storage_account_name = azurerm_storage_account.tfstate.name
  name                  = "tfstate"
  container_access_type = "private"
}






