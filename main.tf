data "azurerm_client_config" "current" {}

### Resource Group ###
module "resource_group" {
  source              = "./modules/resource_group"
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = merge(var.tags, var.tags_customer)
}

### Virtual Network ###
module "virtual_network" {
  source               = "./modules/network/vnet"
  location             = var.location
  resource_group_name  = var.resource_group_name
  vnet_name = var.vnet_name
  vnet_address_space   = var.vnet_address_space
  depends_on           = [module.resource_group]
  tags                = merge(var.tags, var.tags_customer)
}

### Subnet ###
module "subnet" {
  source = "./modules/network/subnet"
  for_each = var.subnets
  resource_group_name     = var.resource_group_name
  vnet_name    = var.vnet_name
  subnet_name             = each.value["subnets_name"]
  subnet_address_prefixes = each.value["subnets_address_prefixes"]
  #subnet_name            = var.subnet_name
  #subnet_address_prefixes = var.subnet_address_prefixes
  depends_on              = [module.virtual_network]
}

### Route Table ####

module "route_table" {
 source              = "./modules/network/route_table"
 route_table_name                = var.route_table_name
 location = var.location
 resource_group_name = var.resource_group_name
 subnet_id = module.subnet.subnet_id
 tags = var.tags
 
 
 routes = [
   {
     name = "route1",
     address_prefix = "10.0.0.0/16",
     next_hop_type = "VirtualAppliance",
     next_hop_in_ip_address = "10.0.0.4"
   },
   {
     name = "route2",
     address_prefix = "10.10.0.0/16",
     next_hop_type = "VirtualAppliance",
     next_hop_in_ip_address = "10.0.0.4"
   }
   
 ]
}
