module "resource_group" {
  source = "./modules/resource_group"

  resource_groups = var.resource_groups
}

module "vnet" {
  source = "./modules/vnet"

  vnets = local.vnets

  depends_on = [module.resource_group]
}

module "subnet" {
  source = "./modules/subnet"

  subnets = local.subnets

  depends_on = [module.vnet]
}

module "storage_account" {
  source = "./modules/storage_account"

  storage_accounts = local.storage_accounts

  depends_on = [module.resource_group]
}

module "nsg" {
  source = "./modules/nsg"

  network_security_groups = local.network_security_groups
  subnet_nsg_associations = local.subnet_nsg_associations

  depends_on = [module.resource_group, module.subnet]
}

module "nsg_rule" {
  source = "./modules/nsg_rule"

  nsg_rules = local.nsg_rules

  depends_on = [module.nsg]
}
