output "storage_accounts_ids" {
  value = { for sa in module.storage_accounts : sa.name => sa.id }
}

output "sql_ids" {
  value = local.sqlserver_name_to_id
}