terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.44.1"
    }
  }
}

provider "azurerm" {
  features {}

}

data "terraform_remote_state" "subnetID" {
  backend = "azurerm"

  config = {
    resource_group_name  = "ResourceGroup-1"
    storage_account_name = "terraformsan01"
    container_name       = "terraform"
    key                  = "terraform.tfstate"


  }
}




resource "azurerm_network_interface" "NIC1" {
  name                = "networkinterface1"
  location            = "West Europe"
  resource_group_name = "ResourceGroup-1"

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.terraform_remote_state.subnetID.outputs.DevSubnet
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface" "NIC2" {
  name                = "networkinterface2"
  location            = "West Europe"
  resource_group_name = "ResourceGroup-1"

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.terraform_remote_state.subnetID.outputs.ProdSubnet
    private_ip_address_allocation = "Dynamic"
  }
}