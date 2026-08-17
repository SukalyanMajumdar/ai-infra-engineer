output "id" {
  description = "Storage account resource ID."
  value       = azurerm_storage_account.this.id
}

output "name" {
  description = "Storage account name."
  value       = azurerm_storage_account.this.name
}

output "containers" {
  description = "Blob container resource IDs."

  value = {
    for key, container in azurerm_storage_container.this :
    key => container.id
  }
}
