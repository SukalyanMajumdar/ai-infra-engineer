variable "name" {
  description = "Globally unique storage account name."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group containing the storage account."
  type        = string
}

variable "location" {
  description = "Azure region."
  type        = string
}

variable "containers" {
  description = "Blob containers to create."

  type = map(object({
    name = string
  }))
}

variable "tags" {
  description = "Resource tags."
  type        = map(string)
}
