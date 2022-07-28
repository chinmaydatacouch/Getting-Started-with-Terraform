terraform {
  required_version = ">= 0.14"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.15.1"
    }
  }
}

# Configure the Microsoft Azure provider
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "az_chinmay_kk"
  location = "westeurope"
  tags = {
    "CreatedBy" = "Chinmay"
  }
}
