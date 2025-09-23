terraform {
  backend "azurerm" {
    resource_group_name  = "rg-rangers-aks"
    storage_account_name = "rangerstfstate"
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
  }
}
