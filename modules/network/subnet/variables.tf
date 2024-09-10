variable "resource_group_name" {
   type        = string
   description = "Resource Group name where Azure resources to be created"
}

variable "vnet_name" {
   type        = string
   description = "Virtual network name for which subnet is associated"
}

variable "subnet_name" {
    type        = string
    description = "Name of the subnet" 
}

variable "subnet_address_prefixes" {
  type         = list(string)
  description  = "Address prefixes for the subnet"
}

#variable "subnet_id" {
#  type = string
#  description = "subnet ID"  
#}
