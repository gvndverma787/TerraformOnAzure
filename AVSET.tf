terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.44.1"
    }

  }

  backend "azurerm" {
    resource_group_name  = "ResourceGroup-1"
    storage_account_name = "terraformsan01"
    container_name       = "terraform"
    key                  = "AVSET.tfstate"
  }
}

provider "azurerm" {
  features {}
}

locals {
  location       = "West Europe"
  ResourceGroup1 = "ResourceGroup-1"
  faultdomain    = 2
  updatedomain   = 6

}

output "avsetid" {
  description = "avset4 id"
  value       = azurerm_availability_set.AVSET4.id

}

resource "azurerm_availability_set" "AVSET1" {
  name                         = "AvailabiltiSet1"
  location                     = local.location
  resource_group_name          = local.ResourceGroup1
  platform_fault_domain_count  = local.faultdomain
  platform_update_domain_count = local.updatedomain
}

resource "azurerm_availability_set" "AVSET2" {
  name                         = "AvailabiltiSet2"
  location                     = local.location
  resource_group_name          = local.ResourceGroup1
  platform_fault_domain_count  = local.faultdomain
  platform_update_domain_count = local.updatedomain
}

resource "azurerm_availability_set" "AVSET3" {
  name                         = "AvailabiltiSet3"
  location                     = local.location
  resource_group_name          = local.ResourceGroup1
  platform_fault_domain_count  = local.faultdomain
  platform_update_domain_count = local.updatedomain
}

resource "azurerm_availability_set" "AVSET4" {
  name                         = "AvailabiltiSet4"
  location                     = local.location
  resource_group_name          = local.ResourceGroup1
  platform_fault_domain_count  = local.faultdomain
  platform_update_domain_count = local.updatedomain
}