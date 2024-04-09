output "name" {
  value = azurerm_storage_account.sa.name
}

output "id" {
  value = azurerm_storage_account.sa.id
}

/*output "vnet_subnet_id_list" {
  value = local.vnet_subnets_ids
}*/

output "primary_access_key" {
  value = azurerm_storage_account.sa.primary_access_key
  sensitive = true
}

output "secondary_access_key" {
  value = azurerm_storage_account.sa.secondary_access_key
  sensitive = true
}

output "primary_connection_string" {
  value = azurerm_storage_account.sa.primary_connection_string
  sensitive = true
}

output "secondary_connection_string" {
  value = azurerm_storage_account.sa.secondary_connection_string
  sensitive = true
}