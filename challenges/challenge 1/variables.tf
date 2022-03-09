
# resource group name
variable "resource_group_name" {
  description = "Resource Group Name"
  type = string
  default = "rg-default"  
}

# resource group location
variable "resource_group_location" {
  description = "Region "
  type = string
  default = "eastus2"  
}

variable "vnet_name" {
  description = "Vnet name"
  type = string
  default = "vnet-default"
}
variable "vnet_address_space" {
  description = "Vnet address"
  type = list(string)
  default = ["10.0.0.0/16"]
}


variable "web_subnet_name" {
  description = "Vnet Web Subnet Name"
  type = string
  default = "websubnet"
}

variable "web_subnet_address" {
  description = "Vnet Web Subnet Address"
  type = list(string)
  default = ["10.0.1.0/24"]
}



variable "app_subnet_name" {
  description = "Vnet App Subnet Name"
  type = string
  default = "appsubnet"
}

variable "app_subnet_address" {
  description = "Vnet App Subnet Address"
  type = list(string)
  default = ["10.0.11.0/24"]
}



variable "db_subnet_name" {
  description = "Virtual Database Subnet Name"
  type = string
  default = "dbsubnet"
}

variable "db_subnet_address" {
  description = "Vnet Database Subnet Adress"
  type = list(string)
  default = ["10.0.21.0/24"]
}