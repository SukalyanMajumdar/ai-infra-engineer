module "resource_group" {
  source = "../modules/resoource_group"

  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

module "vnet" {
  source = "../modules/vnet"

  name                = "vnet-${var.app_name}-${var.environment}"
  resource_group_name = module.resource_group.name
  location            = var.location
  address_space       = var.vnet_address_space
  tags                = var.tags
}

module "nsg" {
  source = "../modules/network_security_group"

  name                = "nsg-${var.app_name}-${var.environment}"
  resource_group_name = module.resource_group.name
  location            = var.location
  security_rules      = var.nsg_security_rules
  tags                = var.tags
}

module "subnet" {
  source = "../modules/subnet"

  name                       = "snet-${var.app_name}-${var.environment}"
  resource_group_name       = module.resource_group.name
  virtual_network_name      = module.vnet.name
  address_prefixes          = var.subnet_address_prefixes
  network_security_group_id = module.nsg.id
}

module "storage_account" {
  source = "../modules/storage_account"

  name                      = var.storage_account_name
  resource_group_name       = module.resource_group.name
  location                  = var.location
  account_tier              = var.storage_account_tier
  account_replication_type  = var.storage_account_replication_type
  tags                      = var.tags
}
