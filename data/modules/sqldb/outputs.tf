/* output "api_management_id" {
  value = resource.azurerm_virtual_network.avn.id
} */
 /* output "endpoint_servicebus_queue_id" {
  value = azurerm_iothub_endpoint_servicebus_queue.endpoint_servicebus_queue.id
  } 

  output "endpoint_eventhub_id" {
  value = azurerm_iothub_endpoint_eventhub.endpoint_eventhub.id
  }

  output "endpoint_servicebus_topic_id" {
  value = azurerm_iothub_endpoint_servicebus_topic.endpoint_servicebus_topic.id
} */


# output "hub_ids" {
#   description = "Map of hubs and their ids."
#   value       = { for h in azurerm_eventhub.events.* : h.name => h.id }
# }

# output "keys" {
#   description = "Map of hubs with keys => primary_key / secondary_key mapping."
#   sensitive   = true
#   value = { for k, h in local.keys : h.key.name => {
#     primary_key   = azurerm_eventhub_authorization_rule.events[k].primary_key
#     secondary_key = azurerm_eventhub_authorization_rule.events[k].secondary_key
#     }
#   }
# }
/* 
output "authorization_keys" {
  description = "Map of authorization keys with their ids."
  value       = { for a in azurerm_eventhub_namespace_authorization_rule.events.* : a.name => a.id }
} */