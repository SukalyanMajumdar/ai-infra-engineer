variable "network_security_groups" {
  description = "Map of NSGs to create. Key is a logical name used for referencing outputs and by the nsg_rule module."
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    tags                = optional(map(string), {})
  }))
  default = {}
}

variable "subnet_nsg_associations" {
  description = "Map of subnet <-> NSG associations. Key is a logical name. subnet_id comes from the subnet module output; nsg_key references a key in var.network_security_groups and is resolved internally (avoids the module depending on its own output)."
  type = map(object({
    subnet_id = string
    nsg_key   = string
  }))
  default = {}
}
