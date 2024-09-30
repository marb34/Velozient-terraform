resource "azurerm_linux_virtual_machine" "app_vm" {
  name                  = "app-vm"
  location              = var.location
  resource_group_name   = azurerm_resource_group.rg.name
  network_interface_ids = [azurerm_virtual_network.app_vm.nic]
  size                  = "Standard_DS1_v2"
  availability_zone     = "1" # Puedes usar múltiples zonas también aquí para alta disponibilidad

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
