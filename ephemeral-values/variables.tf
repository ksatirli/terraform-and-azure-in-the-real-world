variable "azurerm_directory" {
  type        = string
  description = "Name of Directory"
}

variable "azurerm_key_vault_name" {
  type        = string
  description = "Name of Key Vault"
}

variable "azurerm_key_vault_secret_name" {
  type        = string
  description = "Name of Key Vault Secret"
}

variable "azurerm_key_vault_secret_name_ephemeral" {
  type        = string
  description = "Name of Ephemeral Key Vault Secret"
}

variable "azurerm_resource_group_name" {
  type        = string
  description = "Name of Resource Group"
}
