output "current_client_id" {
  description = "Client ID"
  value       = data.azurerm_client_config.current.client_id
}

output "current_tenant_id" {
  description = "Tenant ID"
  value       = data.azurerm_client_config.current.tenant_id
}

output "current_subscription_id" {
  description = "Subscription ID"
  value       = data.azurerm_client_config.current.subscription_id
}

output "current_object_id" {
  description = "Object ID"
  value       = data.azurerm_client_config.current.object_id
}
