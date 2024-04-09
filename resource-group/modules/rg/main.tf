module "region" {
  source  = "claranet/regions/azurerm"
  version = "4.2.0"

  azure_region = var.location
}

resource "azurerm_resource_group" "rg" {
  name     = var.name
  location = module.region.location
  tags = var.tags

  lifecycle {
    prevent_destroy = false
  }
  #versioning {
  #  enabled = true
  #}
}
