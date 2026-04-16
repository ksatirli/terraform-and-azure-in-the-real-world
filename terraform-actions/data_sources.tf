# see https://registry.terraform.io/providers/hashicorp/azurerm/4.69.0/docs/data-sources/resource_group
data "azurerm_resource_group" "main" {
  name = var.azurerm_resource_group_name
}
