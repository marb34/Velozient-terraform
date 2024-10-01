resource "azurerm_linux_virtual_machine_scale_set" "web_vmss" {
  name                = "web-scale-set"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  upgrade_mode        = "Automatic"
  sku      = "Standard_DS1_v2"
  instances = 2

  network_interface {
    name    = "web-nic"
    primary = true

    ip_configuration {
      name                                   = "internal"
      subnet_id                              = azurerm_subnet.subnet_web.id
      primary                                = true
      load_balancer_backend_address_pool_ids = [azurerm_lb_backend_address_pool.lb_backend.id]
    }
  }

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

  zones = ["1", "2", "3"]
}
