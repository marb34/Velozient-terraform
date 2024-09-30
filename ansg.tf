resource "azurerm_network_security_group" "nsg_web" {
  name                = "nsg-web-tier"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_network_security_rule" "nsg_web_rule_allow_http" {
  name                        = "allow-http"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_network_security_group.nsg_web.name
  network_security_group_name = azurerm_network_security_group.nsg_web.name
}

resource "azurerm_network_security_rule" "nsg_web_rule_allow_https" {
  name                        = "allow-https"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_network_security_group.nsg_web.name
  network_security_group_name = azurerm_network_security_group.nsg_web.name
}

resource "azurerm_network_security_group" "nsg_app" {
  name                = "nsg-app-tier"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_network_security_group" "nsg_db" {
  name                = "nsg-db-tier"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
}
