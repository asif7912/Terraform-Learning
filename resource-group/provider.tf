# Configure the Azure provider
terraform {
  backend "azurerm" {}
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.97"
    }
  }
}

provider "azurerm" {
  features {}

  # More information on the authentication methods supported by the AzureRM Provider can be found here:
  # https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs
  environment      = "public"
  subscription_id  = var.subscription_id
  tenant_id        = var.tenant_id
}