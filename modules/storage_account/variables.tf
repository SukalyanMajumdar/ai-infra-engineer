variable "storage_accounts" {
  description = "Map of storage accounts to create. Key is a logical name used for referencing outputs."
  type = map(object({
    name                            = string
    resource_group_name             = string
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
