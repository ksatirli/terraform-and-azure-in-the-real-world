output "key_vault_secrets" {
  value = "https://portal.azure.com/#@${var.azurerm_directory}/resource${data.azurerm_key_vault.main.id}/secrets"
}
