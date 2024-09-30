resource "azurerm_sql_server" "sql_server" {
  name                         = "sqlserver-db-tier"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = "P@ssw0rd1234!"
}

resource "azurerm_sql_database" "sql_db" {
  name                = "database-tier"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  server_name         = azurerm_sql_server.sql_server.name
  sku_name            = "Basic"
}
