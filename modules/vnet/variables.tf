variable "vnets" {
  description = "Map of virtual networks to create. Key is a logical name used for referencing outputs and by the subnet module."
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    address_space       = list(string)
    dns_servers         = optional(list(string), [])
    tags                = optional(map(string), {})
  }))
  default = {}
}
