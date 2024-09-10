variable "location" {
  type        = string
  description = "Region/Location where Azure resources to be created."
}

variable "tags" {
  type = map(string)
  default = {
    SecurityZone = "v2"
    ManagedBy    = "k8s_DevOps_Team"
    
  }
  description = "Any tags that should be present on the Azure resources"
}

variable "tags_customer" {
  default = {
    "Project" : "aks-smo"
  }
  description = "Any tags that cutomer wants to give on the Azure resources"
}

variable "resource_group_name" {
  type        = string
  default = "rg-aks-cluster"
  description = "Resource Group name where Azure resources to be created."
  validation {
    condition     = can(regex("^rg-aks-[0-9A-Za-z_-]{1,83}[[:alnum:]]$", var.resource_group_name)) && length(var.resource_group_name) < 91
    error_message = "The given Resource Group name is not valid. Resource Group name must start with 'rg-aks-', can only contain letters, numbers, underscores and hyphens. Must have less than 90 characters ending with alphanumeric char only. For eg: rg-aks-<appname>-<envname>"
  }
}

variable "vnet_name" {
  type        = string
  description = "Name of Virtual Network."
  default = "vnet-aks-cluster"
  validation {
    condition     = can(regex("^vnet-[0-9A-Za-z_-]{2,53}[A-Za-z0-9]$", var.vnet_name)) && length(var.vnet_name) < 63
    error_message = "The given Virtual Network is not valid. Virtual Network name must start with 'vnet-', can only contain letters, numbers, underscores and hyphens. Must have less than 64 characters ending with alphanumeric char only. For eg: vnet-aks-<appname>-<envname>"
  }
}

variable "vnet_address_space" {
  type        = list(string)
  default = [ "10.0.0.0/16" ]
  description = "Virtual network address space. It should follow CIDR notation,for example ['10.0.0.0/16']"
}

variable "subnets" {
  type = map(object(
    {
      subnets_name = string
      subnets_address_prefixes = list(string) 
    }
  ) )
  default = {
    "subnet-1" = {
      subnets_name = "sub-aks-1"   
      subnets_address_prefixes = ["10.0.1.0/24"]
       }
    #  "subnet-2" = {
    #   subnets_name = "sub-aks-2"
    #   subnets_address_prefixes = ["10.0.2.0/24"]
    #    }
  }
}

# variable "subnet_name" {
#   type = string
#   validation {
#     condition     = can(regex("^sub-[0-9A-Za-z_-]{2,59}[A-Za-z0-9]$", var.subnet_name)) && length(var.subnet_name) < 79
#     error_message = "The given Subnet Name is not valid. Subnet name must start with 'sub-', can only contain letters, numbers, underscores and hyphens. Must have less than 80 characters ending with alphanumeric char only. For eg: sub-aks-<appname>-<envname>"
#   }
#   description = "Name of the subnet"
# }

# variable "subnet_address_prefixes" {
#   type        = list(string)
#   description = "The address prefixes to use for the subnet. It should follow CIDR notation, for example ['10.0.0.0/23']"
# }


############### Route Table ##############
#route table variables
 variable "route_table_name" {
  type = string
  default = "route-table-01"
  description = "Name of the route table"
}
#one single route variable will correspond to one single route table.
variable "routes" {
  type = list(object({
    name   = string
    address_prefix  = string
    next_hop_type   = string
    next_hop_in_ip_address = string
  }))
  default = [
    {
      name = "route1",
      address_prefix = "10.0.0.0/16",
      next_hop_type = "VirtualAppliance",
      next_hop_in_ip_address = "10.0.0.4"
    }
 
  ]
  description = "Routes to associate with route table."
}
 
#variable "subnet_id" {
 #type = string
#description = "subnet ID"  
#}
