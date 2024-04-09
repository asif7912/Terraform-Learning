output "id" {
  value = azurerm_resource_group.rg.id
  description = "The resource group id in use"
}

output "name" {
  value = azurerm_resource_group.rg.name
  description = "The resource group name in use"
}

output "location" {
  value = azurerm_resource_group.rg.location
  description = "The resource group location in use"
}