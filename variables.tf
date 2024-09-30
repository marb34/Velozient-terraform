provider "azurerm" {
  features {}
}

variable "location" {
  default = "East US"
}

variable "resource_group_name" {
  default = "rg-high-availability"
}

variable "vnet_address" {
  default = "10.0.0.0/16"
}

variable "subnet_web" {
  default = "10.0.1.0/24"
}

variable "subnet_app" {
  default = "10.0.2.0/24"
}

variable "subnet_db" {
  default = "10.0.3.0/24"
}
