resource "azurerm_mssql_server" "mssql_server" {
  name                         = var.mssql_server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = var.mssql_server_version
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
  minimum_tls_version          = var.minimum_tls_version
  connection_policy            = var.connection_policy
  azuread_administrator {
    login_username = "test_username"
    object_id      = "daa49cd2-ff67-4c24-b2a9-8ad6363b6339"
  }
  tags                         = var.tags
}

locals{
  subnet_details = [for subnet_details in var.subnets : merge({
      name                                        = ""
      vnet_name                                   = ""
      key                                         = ""
      resource_group                              = ""                        
    }, subnet_details )]

}
data "azurerm_subnet" "vnet_subnet" {
	for_each = { for subnet_details in local.subnet_details : subnet_details.key => subnet_details }
	name                 = each.value.name
	virtual_network_name = each.value.vnet_name
	resource_group_name  = each.value.resource_group
}

resource "azurerm_mssql_virtual_network_rule" "virtual_network_rules" {
  for_each = { for subnet_details in local.subnet_details : subnet_details.key => subnet_details }
	name      = each.key
  server_id = azurerm_mssql_server.mssql_server.id
  subnet_id = data.azurerm_subnet.vnet_subnet[each.key].id
}