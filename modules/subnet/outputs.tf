output "subnet_ids" {
  description = "Map of subnet key => resource ID"
  value       = { for k, v in azurerm_subnet.this : k => v.id }
}

output "subnet_names" {
  description = "Map of subnet key => name"
  value       = { for k, v in azurerm_subnet.this : k => v.name }
}

output "subnet_address_prefixes" {
  description = "Map of subnet key => address prefixes"
  value       = { for k, v in azurerm_subnet.this : k => v.address_prefixes }
}
