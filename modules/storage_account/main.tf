resource "azurerm_storage_account" "this" {
  for_each = var.storage_accounts

  name                            = each.value.name
  resource_group_name             = each.value.resource_group_name
  location                        = each.value.location
  account_tier                    = each.value.account_tier
  account_replication_type        = each.value.account_replication_type
  account_kind                    = each.value.account_kind
  access_tier                     = each.value.access_tier
  min_tls_version                 = each.value.min_tls_version
  https_traffic_only_enabled      = each.value.https_traffic_only_enabled
  allow_nested_items_to_be_public = each.value.allow_nested_items_to_be_public
  public_network_access_enabled   = each.value.public_network_access_enabled
  is_hns_enabled                  = each.value.is_hns_enabled
  tags                            = each.value.tags
}
