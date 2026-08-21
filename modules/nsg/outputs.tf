output "nsg_ids" {
  description = "Map of NSG key => resource ID"
  value       = { for k, v in azurerm_network_security_group.this : k => v.id }
}

output "nsg_names" {
  description = "Map of NSG key => name"
  value       = { for k, v in azurerm_network_security_group.this : k => v.name }
}
