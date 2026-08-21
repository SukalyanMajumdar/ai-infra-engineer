output "nsg_rule_ids" {
  description = "Map of NSG rule key => resource ID"
  value       = { for k, v in azurerm_network_security_rule.this : k => v.id }
}
