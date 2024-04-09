locals {
  global_settings = {

    #Set of tags 
    tags = {
      applicationName = "App Test"
      environment     = var.environment
      owner           = "Faiz"
    }
  }
  # Path to retrieve configuration resources files in json format
  project_path                             = path.module
  resources_configuration_path             = "${local.project_path}/resources"
  storageaccountmanager_configuration_path = "${local.resources_configuration_path}/storageaccount/config-${var.environment}.json"
  sqlservermanager_configuration_path      = "${local.resources_configuration_path}/sqlserver/config-${var.environment}.json"
  sqldbmanager_configuration_path          = "${local.resources_configuration_path}/sqldb/config-${var.environment}.json"


  # Load configuration json
  storageaccountmanager_configuration = jsondecode(file(local.storageaccountmanager_configuration_path))
  sqlservermanager_configuration      = jsondecode(file(local.sqlservermanager_configuration_path))
  sqldbmanager_configuration          = jsondecode(file(local.sqldbmanager_configuration_path))
 

}

# Azure storage accounts
module "storage_accounts" {
  source = "./modules/storageaccount"

  #count = length(local.storageaccountmanager_configuration)
  for_each = local.storageaccountmanager_configuration

  sa_name                  = each.key
  location                 = each.value["location"]
  resource_group_name      = each.value["resource_group"]
  account_tier             = each.value["account_tier"]
  default_action           = each.value["default_action"]
  account_replication_type = each.value["account_replication_type"]
  subnets                  = each.value["subnets"]
  tags                     = local.global_settings.tags
  account_kind             = each.value["account_kind"]
  access_tier              = each.value["access_tier"]
}

# Azure MS SQL servers resources

module "mssql_servers" {
  source = "./modules/sqlserver"

  #count = length(local.sqlservermanager_configuration)
  for_each = local.sqlservermanager_configuration

  mssql_server_name            = each.key
  location                     = each.value["location"]
  resource_group_name          = each.value["resource_group"]
  mssql_server_version         = each.value["version"]
  administrator_login          = each.value["administrator_login"]
  administrator_login_password = each.value["administrator_login_password"]
  connection_policy            = each.value["connection_policy"]
  subnets                      = each.value["subnets"]
  tags                         = local.global_settings.tags
}

locals {
  # Map sql server name to id
  sqlserver_name_to_id = { for sqlserver in module.mssql_servers : sqlserver.name => sqlserver.id }
}

module "mssql_database" {
  source = "./modules/sqldb"

  #count = length(local.sqldbmanager_configuration)
  for_each = local.sqldbmanager_configuration

  sqldb01_name = each.key
  sqlserver_id = local.sqlserver_name_to_id[each.value["sqlserver01_name"]]
  #sqlserver_id           =each.value["sqlserver01_name"]
  sqldb01_collation = each.value["sqldb01_collation"]
  #sqldb01_license_type   = each.value["sqldb01_license_type"]
  sqldb01_sku         = each.value["sqldb01_sku"]
  sqldb01_max_size_gb = each.value["sqldb01_max_size_gb"]
  tags                = local.global_settings.tags
}







