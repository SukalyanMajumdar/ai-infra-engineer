output "id" {
  description = "Virtual network resource ID."
  value       = azurerm_virtual_network.this.id
}

output "name" {
  description = "Virtual network name."
  value       = azurerm_virtual_network.this.name
}

output "subnets" {
  description = "Subnet resource IDs."

  value = {
    for key, subnet in azurerm_subnet.this :
    key => subnet.id
  }
}
