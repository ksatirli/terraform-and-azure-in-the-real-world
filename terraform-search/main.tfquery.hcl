# see https://registry.terraform.io/providers/hashicorp/azurerm/4.69.0/docs/list-resources/storage_account
list "azurerm_storage_account" "unmanaged" {
  provider = azurerm

  config {
    resource_group_name = "rg-demo"
  }
}
