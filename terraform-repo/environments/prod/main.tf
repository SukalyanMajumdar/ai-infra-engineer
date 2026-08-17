module "resource_group" {
  source = "../../modules/resource_group"

  for_each = var.resource_groups

  name     = each.value.name
  location = var.location
  tags     = var.tags
}

module "network" {
  source = "../../modules/network"

  for_each = var.vnets

  name                = each.value.name
  resource_group_name = module.resource_group[each.value.resource_group_key].name
  location            = var.location
  address_space       = each.value.address_space
  subnets             = each.value.subnets
  tags                = var.tags
}

module "storage" {
  source = "../../modules/storage"

  for_each = var.storage_accounts

  name                = each.value.name
  resource_group_name = module.resource_group[each.value.resource_group_key].name
  location            = var.location
  containers          = each.value.containers
  tags                = var.tags
}
