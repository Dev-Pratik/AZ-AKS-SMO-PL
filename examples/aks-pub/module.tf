module "aks_smo"{
    source = "git::https://github.com/Dev-Pratik/AZ-AKS-SMO-PL.git"
    location = "eastus"
    resource_group_name     = "rg-aks-smo"
    virtual_network_name    = "vnet-aks-1"
    vnet_address_space      = ["10.0.0.0/16"]
    
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


