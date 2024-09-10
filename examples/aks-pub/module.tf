module "aks_smo"{
    source = "git::https://github.com/Dev-Pratik/AZ-AKS-SMO-PL.git"
    location = "eastus"
    resource_group_name     = "rg-aks-smo"
    virtual_network_name    = "vnet-aks-1"
    vnet_address_space      = ["10.0.0.0/16"]
    subnet_id               = "/subscriptions/739f2744-f1cc-4a85-978e-71f83a5145e5/resourceGroups/pbtest-rg/providers/Microsoft.Network/virtualNetworks/rbtest/subnets/default"
  
  #  subnet_name             = "sub-aks-1"
  #  subnet_address_prefixes = ["10.0.1.0/24"]

    subnets = {
    subnet-3 = {
      subnets_name             = "sub-aks-3"
      subnets_address_prefixes = ["10.0.3.0/24"]
    }
    subnet-4 = {
      subnets_name             = "sub-aks-4"
      subnets_address_prefixes = ["10.0.4.0/24"]
    }
 }
    tags_customer           = {
        "Project"      : "aks-smo"
        "Environment"  : "Dev"
    }    
}


