output "location" {
  value = azurerm_resource_group.rg.location
  description = "Location where Azure resources to be created."
}

output "rg_name" {
  value = azurerm_resource_group.rg.name
  description = "Resource Group name where Azure resources to be created."
}
