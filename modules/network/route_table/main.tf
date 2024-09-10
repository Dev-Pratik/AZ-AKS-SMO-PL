resource "azurerm_route_table" "route_table" {
  name     = var.route_table_name
  resource_group_name  = var.resource_group_name 
  location     = var.location
  tags   = var.tags
}


resource "azurerm_route" "routes" {
  for_each   = { for route in var.routes : route.name => route }
  name   = each.value.name
  resource_group_name    = azurerm_route_table.route_table.resource_group_name
  route_table_name   = azurerm_route_table.route_table.name
  address_prefix     = each.value.address_prefix
  next_hop_type = each.value.next_hop_type
  next_hop_in_ip_address = each.value.next_hop_in_ip_address
}


 resource "azurerm_subnet_route_table_association" "rt_association" {
   subnet_id = output.subnet_id
  route_table_id = azurerm_route_table.route_table.id
 
}
