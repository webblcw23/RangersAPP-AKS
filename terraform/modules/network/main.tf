
# Virtual Network
resource "azurerm_virtual_network" "rangers_vnet" {
  name                = "rangers-vnet-clean"
  address_space       = ["10.10.0.0/16"]
    location            = var.location
    resource_group_name = var.resource_group_name
}

# Subnet 
resource "azurerm_subnet" "aks_subnet" {
  name                 = "rangers-subnet-aks-clean"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.rangers_vnet.name
   address_prefixes     = ["10.10.1.0/24"]
}

# NSG creation
resource "azurerm_network_security_group" "rangers_nsg" {
  name                = "rangers-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name

security_rule {
    name                       = "AllowHTTPS"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    }
}

# NSG Association with Subnet
resource "azurerm_subnet_network_security_group_association" "aks_subnet_nsg" {
  subnet_id                 = azurerm_subnet.aks_subnet.id
  network_security_group_id = azurerm_network_security_group.rangers_nsg.id
}
