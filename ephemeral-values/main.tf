# see https://registry.terraform.io/providers/hashicorp/azurerm/4.69.0/docs/data-sources/key_vault
data "azurerm_key_vault" "main" {
  name                = var.azurerm_key_vault_name
  resource_group_name = var.azurerm_resource_group_name
}

# see https://registry.terraform.io/providers/hashicorp/azurerm/4.69.0/docs/resources/key_vault_secret
data "azurerm_key_vault_secret" "main" {
  key_vault_id = data.azurerm_key_vault.main.id
  name         = var.azurerm_key_vault_secret_name
}

# see https://registry.terraform.io/providers/hashicorp/azurerm/4.69.0/docs/ephemeral-resources/key_vault_secret
# ephemeral "azurerm_key_vault_secret" "main" {
#   key_vault_id = data.azurerm_key_vault.main.id
#   name         = var.azurerm_key_vault_secret_name_ephemeral
# }
