locals {
  # Re-shape the flat, key-referencing tfvars maps into the exact
  # object shapes each module expects, resolving cross references
  # (e.g. resource_group_key -> actual RG name) via module outputs.

  storage_accounts = {
    for k, v in var.storage_accounts : k => {
      name                             = v.name
      resource_group_name              = module.resource_group.resource_group_names[v.resource_group_key]
      location                         = v.location
      account_tier                     = v.account_tier
      account_replication_type         = v.account_replication_type
      account_kind                     = v.account_kind
      access_tier                      = v.access_tier
      min_tls_version                  = v.min_tls_version
      https_traffic_only_enabled       = v.https_traffic_only_enabled
      allow_nested_items_to_be_public  = v.allow_nested_items_to_be_public
      public_network_access_enabled    = v.public_network_access_enabled
      is_hns_enabled                   = v.is_hns_enabled
      tags                             = merge(var.common_tags, v.tags)
    }
  }

  vnets = {
    for k, v in var.vnets : k => {
      name                = v.name
      resource_group_name = module.resource_group.resource_group_names[v.resource_group_key]
      location            = v.location
      address_space       = v.address_space
      dns_servers         = v.dns_servers
      tags                = merge(var.common_tags, v.tags)
    }
  }

  subnets = {
    for k, v in var.subnets : k => {
      name                              = v.name
      resource_group_name               = module.resource_group.resource_group_names[v.resource_group_key]
      virtual_network_name              = module.vnet.vnet_names[v.vnet_key]
      address_prefixes                  = v.address_prefixes
      service_endpoints                 = v.service_endpoints
      private_endpoint_network_policies = v.private_endpoint_network_policies
      delegation                        = v.delegation
    }
  }

  network_security_groups = {
    for k, v in var.network_security_groups : k => {
      name                = v.name
      resource_group_name = module.resource_group.resource_group_names[v.resource_group_key]
      location            = v.location
      tags                = merge(var.common_tags, v.tags)
    }
  }

  subnet_nsg_associations = {
    for k, v in var.subnet_nsg_associations : k => {
      subnet_id = module.subnet.subnet_ids[v.subnet_key]
      nsg_key   = v.nsg_key
    }
  }

  nsg_rules = {
    for k, v in var.nsg_rules : k => {
      name                          = v.name
      resource_group_name           = module.resource_group.resource_group_names[v.resource_group_key]
      network_security_group_name   = module.nsg.nsg_names[v.nsg_key]
      priority                      = v.priority
      direction                     = v.direction
      access                        = v.access
      protocol                      = v.protocol
      source_port_range             = v.source_port_range
      source_port_ranges            = v.source_port_ranges
      destination_port_range        = v.destination_port_range
      destination_port_ranges       = v.destination_port_ranges
      source_address_prefix         = v.source_address_prefix
      source_address_prefixes       = v.source_address_prefixes
      destination_address_prefix    = v.destination_address_prefix
      destination_address_prefixes  = v.destination_address_prefixes
      description                   = v.description
    }
  }
}
