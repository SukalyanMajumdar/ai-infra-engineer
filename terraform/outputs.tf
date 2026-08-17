output "resource_group_name" {
  value = module.resource_group.name
}

output "vnet_id" {
  value = module.vnet.id
}

output "subnet_id" {
  value = module.subnet.id
}

output "nsg_id" {
  value = module.nsg.id
}

output "storage_account_name" {
  value = module.storage_account.name
}
