variable "name" {
  description = "Virtual network name."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group containing the virtual network."
  type        = string
}

variable "location" {
  description = "Azure region."
  type        = string
}

variable "address_space" {
  description = "Address space for the virtual network."
  type        = list(string)
}

variable "subnets" {
  description = "Subnets to create inside the virtual network."

  type = map(object({
    name             = string
    address_prefixes = list(string)
  }))
}

variable "tags" {
  description = "Resource tags."
  type        = map(string)
}
