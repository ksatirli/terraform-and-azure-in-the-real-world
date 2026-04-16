# Ephemeral Values

Upstream Documentation: [developer.hashicorp.com](https://developer.hashicorp.com/terraform/language/manage-sensitive-data/ephemeral)

<!-- BEGIN_TF_DOCS -->
### Inputs

| Name | Description | Type | Required |
| ---- | ----------- | ---- | :------: |
| azurerm_directory | Name of Directory | `string` | yes |
| azurerm_key_vault_name | Name of Key Vault | `string` | yes |
| azurerm_key_vault_secret_name | Name of Key Vault Secret | `string` | yes |
| azurerm_key_vault_secret_name_ephemeral | Name of Ephemeral Key Vault Secret | `string` | yes |
| azurerm_resource_group_name | Name of Resource Group | `string` | yes |

### Outputs

| Name | Description |
| ---- | ----------- |
| key_vault_secrets | n/a |
<!-- END_TF_DOCS -->
