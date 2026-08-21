variable "subscription_id" {
  description = "Azure subscription ID the provider authenticates against."
  type        = string
}

variable "environment" {
  description = "Environment name (e.g. dev, staging, prod). Used for tagging/naming."
  type        = string
  default     = "dev"
}

variable "common_tags" {
  description = "Tags applied/merged across all resources via each resource's own tags map (set from core.tfvars)."
  type        = map(string)
  default     = {}
}

variable "resource_groups" {
  description = "Map of resource groups to create."
  type = map(object({
    name     = string
    location = string
    tags     = optional(map(string), {})
  }))
  default = {}
}

variable "storage_accounts" {
  description = "Map of storage accounts to create."
  type = map(object({
    name                            = string
    resource_group_key              = string # key into var.resource_groups
    location                        = string
    account_tier                    = string
    account_replication_type        = string
    account_kind                    = optional(string, "StorageV2")
    access_tier                     = optional(string, "Hot")
    min_tls_version                 = optional(string, "TLS1_2")
    https_traffic_only_enabled      = optional(bool, true)
    allow_nested_items_to_be_public = optional(bool, false)
    public_network_access_enabled   = optional(bool, true)
    is_hns_enabled                  = optional(bool, false)
    tags                            = optional(map(string), {})
  }))
  default = {}
}

variable "vnets" {
  description = "Map of virtual networks to create."
  type = map(object({
    name               = string
    resource_group_key = string # key into var.resource_groups
    location           = string
    address_space      = list(string)
    dns_servers        = optional(list(string), [])
    tags               = optional(map(string), {})
  }))
  default = {}
}

variable "subnets" {
  description = "Map of subnets to create."
  type = map(object({
    name                              = string
    resource_group_key                = string # key into var.resource_groups
    vnet_key                          = string # key into var.vnets
    address_prefixes                  = list(string)
    service_endpoints                 = optional(list(string), [])
    private_endpoint_network_policies = optional(string, "Disabled")
    delegation = optional(object({
      name                       = string
      service_delegation_name    = string
      service_delegation_actions = optional(list(string), [])
    }), null)
  }))
  default = {}
}

variable "network_security_groups" {
  description = "Map of NSGs to create."
  type = map(object({
    name               = string
    resource_group_key = string # key into var.resource_groups
    location           = string
    tags               = optional(map(string), {})
  }))
  default = {}
}

variable "subnet_nsg_associations" {
  description = "Map of subnet <-> NSG associations."
  type = map(object({
    subnet_key = string # key into var.subnets
    nsg_key    = string # key into var.network_security_groups
  }))
  default = {}
}

variable "nsg_rules" {
  description = "Map of NSG rules to create."
  type = map(object({
    name                         = string
    nsg_key                      = string # key into var.network_security_groups
    resource_group_key           = string # key into var.resource_groups
    priority                     = number
    direction                    = string
    access                       = string
    protocol                     = string
    source_port_range            = optional(string, null)
    source_port_ranges           = optional(list(string), null)
    destination_port_range       = optional(string, null)
    destination_port_ranges      = optional(list(string), null)
    source_address_prefix        = optional(string, null)
    source_address_prefixes      = optional(list(string), null)
    destination_address_prefix   = optional(string, null)
    destination_address_prefixes = optional(list(string), null)
    description                  = optional(string, null)
  }))
  default = {}
}
