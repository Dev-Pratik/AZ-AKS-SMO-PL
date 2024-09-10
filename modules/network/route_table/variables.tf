 variable "route_table_name" {
  type = string
  default = "route-table-01"
  description = "Name of the route table"
}

variable "routes" {
  type = list(object({
    name   = string
    address_prefix  = string
    next_hop_type   = string
    next_hop_in_ip_address = string
  }))
}

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

#variable "subnet_id" {
#  type = string
#  description = "subnet ID"  
#}


