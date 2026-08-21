output "resource_group_ids" {
  description = "Map of resource group key => resource group ID"
  value       = { for k, v in azurerm_resource_group.this : k => v.id }
}

output "resource_group_names" {
  description = "Map of resource group key => resource group name"
  value       = { for k, v in azurerm_resource_group.this : k => v.name }
}

output "resource_group_locations" {
  description = "Map of resource group key => resource group location"
  value       = { for k, v in azurerm_resource_group.this : k => v.location }
}
