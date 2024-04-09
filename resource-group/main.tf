locals {
  default_location = var.location
  global_settings = {

    #Set of tags 
    tags = {
      applicationName = "test app"
      environment     = var.environment
      owner           = "Faiz"
    }
  }
}

# Deploy on a single region the given environment
module "resource_groups" {
  source = "./modules/rg"

  for_each = var.resource_groups

  name                         = each.key
  location                     = coalesce(each.value.location, local.default_location)
  tags                         = merge(local.global_settings.tags, each.value.tags)
}