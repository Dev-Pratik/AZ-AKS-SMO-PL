variable "location" {
  type = string
  description = "Region/Location where resources to be created."
}

variable "resource_group_name" {
  type = string
  description = "Resource Group name where Azure resources to be created."  
}

variable "tags" {
  type = map(string)
  description = "Tags"
}
