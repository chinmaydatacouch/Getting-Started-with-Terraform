terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.15.0"
    }
  }
  
  backend "azurerm" {
    resource_group_name  = "az_chinmay_kk"
    storage_account_name = "examplestoraccountck1"
    container_name       = "vhdsck"
    key                  = "test.chinmay.azurerm"
  }
}

provider "azurerm" {
  features {
  }
}


resource "azurerm_resource_group" "example" {
  name     = "example_test_23"
location = "West Europe"
}