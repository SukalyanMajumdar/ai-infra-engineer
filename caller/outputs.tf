output "resource_group_ids" {
  description = "Map of resource group key => resource group ID"
  value       = module.resource_group.resource_group_ids
}

output "storage_account_ids" {
  description = "Map of storage account key => resource ID"
  value       = module.storage_account.storage_account_ids
}

output "storage_account_primary_blob_endpoints" {
  description = "Map of storage account key => primary blob endpoint"
  value       = module.storage_account.storage_account_primary_blob_endpoints
}

output "vnet_ids" {
  description = "Map of vnet key => resource ID"
  value       = module.vnet.vnet_ids
}

output "subnet_ids" {
  description = "Map of subnet key => resource ID"
  value       = module.subnet.subnet_ids
}

output "nsg_ids" {
  description = "Map of NSG key => resource ID"
  value       = module.nsg.nsg_ids
}

output "nsg_rule_ids" {
  description = "Map of NSG rule key => resource ID"
  value       = module.nsg_rule.nsg_rule_ids
}
