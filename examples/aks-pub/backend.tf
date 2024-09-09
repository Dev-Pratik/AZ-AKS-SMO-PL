 terraform {
    backend "azurerm" {
  # subscription_id      = "***"                # Customer should provide correct Subscription ID to deply Azure/AKS resources
    resource_group_name  = "pbtest-rg"          # Resource Group should be created by Customer
    storage_account_name = "akspbtest"          # Storage Account should be created by Customer 
    container_name       = "pb-terraformstate" # Container should be created by Customer
    key                  = "terraform-smo1.tfstate"
  }
 }
