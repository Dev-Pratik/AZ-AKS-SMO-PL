variable "location" {
  type = string
    description = "Region/Location where resources to be created."
}
variable "tags" {
  type = map(string)
  description = "Tags"
}
variable "resource_group_name" {
  type = string
    description = "Resource Group name where Azure resources needs to be deployed."
}

variable "vnet_name" {
   type = string
    description = "Name of Virtual network."
}

variable "vnet_address_space" {
  type = list(string)
    description = "Virtual network address space. for example - ['10.0.0.0/16']"
}






