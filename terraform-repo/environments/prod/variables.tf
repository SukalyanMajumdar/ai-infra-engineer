variable "subscription_id" {
  description = "Azure subscription ID."
  type        = string
  sensitive   = true
}

variable "location" {
  description = "Azure region."
  type        = string
}

variable "environment" {
  description = "Deployment environment."
  type        = string

  validation {
    condition     = var.environment == "prod"
    error_message = "This Terraform root is dedicated to the prod environment."
  }
}

variable "resource_groups" {
  description = "Production resource groups."

  type = map(object({
    name = string
  }))
}

variable "tags" {
  description = "Mandatory tags applied to all resources."
  type        = map(string)

  validation {
    condition = alltrue([
      contains(keys(var.tags), "environment"),
      contains(keys(var.tags), "owner"),
      contains(keys(var.tags), "managed_by")
    ])

    error_message = "Tags must include environment, owner, and managed_by."
  }
}

variable "vnets" {
  description = "Production virtual networks."

  type = map(object({
    name               = string
    resource_group_key = string
    address_space      = list(string)

    subnets = map(object({
      name             = string
      address_prefixes = list(string)
    }))
  }))
}

variable "storage_accounts" {
  description = "Production storage accounts."

  type = map(object({
    name               = string
    resource_group_key = string

    containers = map(object({
      name = string
    }))
  }))
}
