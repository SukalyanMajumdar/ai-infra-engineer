output "vnet_ids" {
  description = "Map of vnet key => resource ID"
  value       = { for k, v in azurerm_virtual_network.this : k => v.id }
}

output "vnet_names" {
  description = "Map of vnet key => name"
  value       = { for k, v in azurerm_virtual_network.this : k => v.name }
}

output "vnet_address_spaces" {
  description = "Map of vnet key => address space"
  value       = { for k, v in azurerm_virtual_network.this : k => v.address_space }
}
