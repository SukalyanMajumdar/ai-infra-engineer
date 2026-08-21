output "storage_account_ids" {
  description = "Map of storage account key => resource ID"
  value       = { for k, v in azurerm_storage_account.this : k => v.id }
}

output "storage_account_names" {
  description = "Map of storage account key => name"
  value       = { for k, v in azurerm_storage_account.this : k => v.name }
}

output "storage_account_primary_blob_endpoints" {
  description = "Map of storage account key => primary blob endpoint"
  value       = { for k, v in azurerm_storage_account.this : k => v.primary_blob_endpoint }
}

output "storage_account_primary_access_keys" {
  description = "Map of storage account key => primary access key"
  value       = { for k, v in azurerm_storage_account.this : k => v.primary_access_key }
  sensitive   = true
}
