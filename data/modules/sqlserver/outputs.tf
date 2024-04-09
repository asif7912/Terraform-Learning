output "name" {
  description = "SQL Server name."
  value       = azurerm_mssql_server.mssql_server.name
}

output "id" {
  description = "SQL Server Id."
  value       = azurerm_mssql_server.mssql_server.id
}