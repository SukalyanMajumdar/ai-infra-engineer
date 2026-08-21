variable "subnets" {
  description = "Map of subnets to create. Key is a logical name used for referencing outputs and by the nsg association."
  type = map(object({
    name                            = string
    resource_group_name             = string
    virtual_network_name            = string
    address_prefixes                = list(string)
    service_endpoints                = optional(list(string), [])
    private_endpoint_network_policies = optional(string, "Disabled")
    delegation = optional(object({
      name                       = string
      service_delegation_name   = string
      service_delegation_actions = optional(list(string), [])
    }), null)
  }))
  default = {}
}
