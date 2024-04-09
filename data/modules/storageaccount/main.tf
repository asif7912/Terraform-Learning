

resource "azurerm_storage_account" "sa" {
  name                      = var.sa_name
  location                  = var.location
  account_tier              = var.account_tier
  resource_group_name       = var.resource_group_name
  account_replication_type  = var.account_replication_type
  enable_https_traffic_only = true
  tags                      = var.tags
  account_kind              =var.account_kind
  access_tier               =var.access_tier

}




