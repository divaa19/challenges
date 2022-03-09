terraform {
  required_version = ">= 1.0.0"  
  required_providers {            
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.0"
    }
  }
  
  # storing the state file in to Azure container
  backend "azurerm" { 
    resource_group_name   = "terraform-storage-rg"
    storage_account_name  = "terraformstateaz01"
    container_name        = "tfstatefiles"
    key                   = "terraform.tfstate"
  } 