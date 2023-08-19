#imported resource group
resource "azurerm_resource_group" "etpx-apim-rg" {
  name     = "${var.rg_name}"
  location = "${var.location}"
}

# module "etpx-apim" {
#   source    = "./modules/virtual_network"
# #}

#imported API management instance
resource "azurerm_api_management" "etpx-apim" {
#  source               =""
  name                 = "${var.apim_name}"
  location             = azurerm_resource_group.etpx-apim-rg.location
  resource_group_name  = azurerm_resource_group.etpx-apim-rg.name
  publisher_name       = "${var.publisher_name}"
  publisher_email      = "${var.publisher_email}"
  sku_name             = "${var.sku_name}"
  virtual_network_type = "${var.vir_net_type}"
  #public_ip_address_id = var.azurerm_public_ip.public_ip_resource.id
  #min_api_version      = "2021-08-01"
  virtual_network_configuration {
      subnet_id = azurerm_subnet.etpx-apim-sn.id
  }
  }

