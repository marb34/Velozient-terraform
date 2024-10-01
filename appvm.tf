resource "azurerm_linux_virtual_machine" "app_vm" {
  name                  = "app-vm"
  location              = var.location
  resource_group_name   = azurerm_resource_group.rg.name
  network_interface_ids = [azurerm_subnet.subnet_app.id]
  size                  = "Standard_DS1_v2"

  admin_username = "adminuser"
  admin_password = "P@ssw0rd1234!"

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}
