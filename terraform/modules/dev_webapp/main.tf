
resource "azurerm_service_plan" "rangers_plan_dev" {
  name                = "rangers-plan-dev"
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = "Linux"
  sku_name            = "B1"
}

resource "azurerm_linux_web_app" "rangers_webapp_dev" {
  name                = "rangers-webapp-dev"
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = azurerm_service_plan.rangers_plan_dev.id
  https_only = true  # 🔐 Enforces HTTPS for secure web app 
  
    site_config {
    application_stack {
      docker_image_name   = "${var.image_name}:${var.image_tag}"
      docker_registry_url = "https://rangersacr.azurecr.io"
    }
      container_registry_use_managed_identity = true
  }

  identity {
    type = "SystemAssigned"
  }

   app_settings = {
    "WEBSITES_PORT" = "80"
  }
}
