terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.44.1"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "resourceGroup" {
  name     = "ResourceGroup-1"
  location = "West Europe"
}


resource "azurerm_virtual_network" "virtualNetwork" {
  name                = "virtualNetwork1"
  location            = azurerm_resource_group.resourceGroup.location
  resource_group_name = azurerm_resource_group.resourceGroup.name
  address_space       = ["10.0.0.0/16"]
}