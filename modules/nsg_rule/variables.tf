variable "nsg_rules" {
  description = "Map of NSG rules to create. Key is a logical name used for referencing outputs."
  type = map(object({
    name                         = string
    resource_group_name          = string
    network_security_group_name  = string
    priority                     = number
    direction                    = string # Inbound or Outbound
    access                       = string # Allow or Deny
    protocol                     = string # Tcp, Udp, Icmp, Esp, Ah, *
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
