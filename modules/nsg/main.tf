resource "azurerm_network_security_group" "this" {
  for_each = var.network_security_groups

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  tags                = each.value.tags
}

resource "azurerm_subnet_network_security_group_association" "this" {
  for_each = var.subnet_nsg_associations

  subnet_id                 = each.value.subnet_id
  network_security_group_id = azurerm_network_security_group.this[each.value.nsg_key].id
}
