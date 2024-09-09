output "vnet_name" {
  description = "Name of virtual Network"
  value = azurerm_virtual_network.vnet.name
}

output "vnet_address_space" {
  description = "Address space for Vnet."
  value = azurerm_virtual_network.vnet.address_space
}
