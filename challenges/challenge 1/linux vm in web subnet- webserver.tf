
locals {
webvm_custom_data = <<CUSTOM_DATA
#!/bin/sh
sudo yum update -y
sudo yum install -y httpd
sudo systemctl enable httpd
sudo systemctl start httpd  
sudo systemctl stop firewalld
sudo systemctl disable firewalld
sudo chmod -R 777 /var/www/html 
sudo echo "This is a test page for IAC through Terraform on Azure Cloud" > /var/www/html/index.html
CUSTOM_DATA
}


# Azure Linux Virtual Machine
resource "azurerm_linux_virtual_machine" "web_linuxvm" {
  name = "az-aks-web-linuxvm"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location 
  size = "Standard_DS1_v2"
  admin_username = "azureusertest"
  network_interface_ids = [ azurerm_network_interface.web_linuxvm_nic.id ]
 
  os_disk {
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }  
  source_image_reference {
    publisher = "RedHat"
    offer = "RHEL"
    sku = "83-gen2"
    version = "latest"
  }  
  
  custom_data = base64encode(local.webvm_custom_data)
}