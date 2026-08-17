output "resource_groups" {
  description = "Production resource groups."

  value = {
    for key, rg in module.resource_group :
    key => rg.name
  }
}

output "vnets" {
  description = "Production virtual networks."

  value = {
    for key, network in module.network :
    key => {
      id      = network.id
      name    = network.name
      subnets = network.subnets
    }
  }
}

output "storage_accounts" {
  description = "Production storage accounts."

  value = {
    for key, storage in module.storage :
    key => {
      id         = storage.id
      name       = storage.name
      containers = storage.containers
    }
  }
}
