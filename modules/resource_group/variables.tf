variable "resource_groups" {
  description = "Map of resource groups to create. Key is a logical name used for referencing outputs."
  type = map(object({
    name     = string
    location = string
    tags     = optional(map(string), {})
  }))
  default = {}
}
