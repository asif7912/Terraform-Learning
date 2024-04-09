resource "azurerm_mssql_database" "sqldb01" {
  name         = var.sqldb01_name
  server_id    = var.sqlserver_id
  collation    = var.sqldb01_collation
  #license_type = var.sqldb01_license_type
  sku_name     = var.sqldb01_sku
  max_size_gb  = var.sqldb01_max_size_gb
  tags         = var.tags
}