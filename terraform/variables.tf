variable "app_name" {
  description = "Application/workload name, used as a naming prefix"
  type        = string
}

variable "environment" {
  description = "Environment name (e.g. dev, prd)"
  type        = string
}

variable "location" {
  description = "Azure region to deploy resources into"
  type        = string
  default     = "eastus"
}

variable "resource_group_name" {
  description = "Name of the resource group to create"
  type        = string
}

variable "vnet_address_space" {
  description = "Address space for the virtual network"
  type        = list(string)
}

variable "subnet_address_prefixes" {
  description = "Address prefixes for the subnet"
  type        = list(string)
}

variable "storage_account_name" {
  description = "Name of the storage account (globally unique, lowercase, 3-24 chars)"
  type        = string
}

variable "storage_account_tier" {
  description = "Storage account performance tier"
  type        = string
  default     = "Standard"
}

variable "storage_account_replication_type" {
  description = "Storage account replication type"
  type        = string
  default     = "LRS"
}

variable "nsg_security_rules" {
  description = "List of security rules to apply to the NSG"
  type = list(object({
    name                        = string
    priority                    = number
    direction                   = string
    access                      = string
    protocol                    = string
    source_port_range           = string
    destination_port_range      = string
    source_address_prefix       = string
    destination_address_prefix  = string
  }))
  default = []
}

variable "tags" {
  description = "Common tags applied to all resources"
  type        = map(string)
  default     = {}
}
