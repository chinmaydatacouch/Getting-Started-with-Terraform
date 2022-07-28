terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.15.0"
    }
  }
}

provider "azurerm" {
  features {
  }
}

variable "subnets" {
  type = map(any)
  default = {
    "snet-web" = "10.220.5.0/24"
    "snet-app" = "10.220.10.0/24"
    "snet-db" = "10.220.15.0/24"  }
}

variable "subnetval" {
  default = [
    {
      "name" :"snet",
      "value" : "10.220.5.0/24"
    }
  ]
}

# output "test" {
#   value = {for val in var.subnetval: val.name=>val.value}
# }

resource "azurerm_resource_group" "tfexample" {
  name     = "my-terraform-rg-ck123"
  location = "West Europe"
}

# Create a Virtual Network
resource "azurerm_virtual_network" "tfexample" {
  name                = "my-terraform-vnet"
  location            = azurerm_resource_group.tfexample.location
  resource_group_name = azurerm_resource_group.tfexample.name
  address_space       = ["10.220.0.0/16"]
}

# locals {
#   subnets = {for val in var.subnetval: val.name=>val.value}
# }
variable "provision_subnet" {
  default = true
}

resource "azurerm_subnet" "tfsubnet" {
  for_each = {for val in var.subnetval: val.name=>val.value}
  name = each.key
  resource_group_name = azurerm_resource_group.tfexample.name
  virtual_network_name = azurerm_virtual_network.tfexample.name
  address_prefixes = [each.value] 
}

output "subnets" {
  value = azurerm_subnet.tfsubnet
}