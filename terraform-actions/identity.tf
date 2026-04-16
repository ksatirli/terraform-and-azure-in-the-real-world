# see https://registry.terraform.io/providers/hashicorp/azurerm/4.69.0/docs/resources/user_assigned_identity
resource "azurerm_user_assigned_identity" "main" {
  location            = data.azurerm_resource_group.main.location
  name                = "main-identity"
  resource_group_name = data.azurerm_resource_group.main.name
}
