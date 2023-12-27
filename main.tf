# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  skip_provider_registration = true # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}
}

resource "azurerm_resource_group" "mtsc-rg" {
  name     = "pond-rg"
  location = " East US"
  tags = {
    Environment = "dev"
  }
}

resource "azurerm_virtual_network" "mtsc-vn" {
  name                = "pond-vn"
  resource_group_name = azurerm_resource_group.mtsc-rg.name
  location            = azurerm_resource_group.mtsc-rg.location
  address_space       = ["10.8.0.0/16"]

  subnet {
    name           = "MemberServers"
    address_prefix = "10.8.1.0/24"

  }

}
#   stop





