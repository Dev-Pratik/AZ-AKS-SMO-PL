output "subnet_name" {
  value = azurerm_subnet.subnet.name
  description = "Name of Subnet"
}

output "subnet_address_prefixes" {
  value       = azurerm_subnet.subnet.address_prefixes
  description = "Address prefix for subnet"
}

output "subnet_id" {
  value = azurerm_subnet.subnet.id
  
}