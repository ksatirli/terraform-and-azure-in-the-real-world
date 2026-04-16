## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.14.0, < 2.0.0 |
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | >= 3.8.0, < 4.0.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 4.69.0, < 5.0.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.8.0, < 4.0.0 |
| <a name="requirement_tfe"></a> [tfe](#requirement\_tfe) | >= 0.76.0, < 1.0.0 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_azuread"></a> [azuread](#provider\_azuread) | 3.8.0 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 4.69.0 |
| <a name="provider_tfe"></a> [tfe](#provider\_tfe) | 0.76.2 |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [azuread_application.main](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/application) | resource |
| [azuread_application_federated_identity_credential.main](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/application_federated_identity_credential) | resource |
| [azuread_service_principal.main](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/service_principal) | resource |
| [azurerm_role_assignment.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [tfe_project.main](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/project) | resource |
| [tfe_project_variable_set.main](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/project_variable_set) | resource |
| [tfe_variable.arm_subscription_id](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable.arm_tenant_id](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable.tfc_azure_provider_auth](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable.tfc_azure_run_client_id](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable_set.main](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable_set) | resource |
| [tfe_workspace.main](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/workspace) | resource |
| [azuread_client_config.main](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/client_config) | data source |
| [azurerm_subscription.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription) | data source |
| [tfe_organization.main](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/data-sources/organization) | data source |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_azure_subscription_id"></a> [azure\_subscription\_id](#input\_azure\_subscription\_id) | Azure Subscription ID for workshop resources | `string` | n/a | yes |
| <a name="input_azure_tenant_id"></a> [azure\_tenant\_id](#input\_azure\_tenant\_id) | Azure Tenant ID for workshop resources | `string` | n/a | yes |
| <a name="input_project_identifier"></a> [project\_identifier](#input\_project\_identifier) | Name prefix for the workshop project (lowercase, no spaces, alphanumeric and hyphens only) | `string` | `"workshop"` | no |
| <a name="input_tfe_organization_name"></a> [tfe\_organization\_name](#input\_tfe\_organization\_name) | HCP Terraform organization name | `string` | n/a | yes |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_azure_app_client_id"></a> [azure\_app\_client\_id](#output\_azure\_app\_client\_id) | Azure AD Application Client ID used for OIDC |
| <a name="output_service_principal_object_id"></a> [service\_principal\_object\_id](#output\_service\_principal\_object\_id) | Azure AD Service Principal Object ID |

<!-- BEGIN_TF_DOCS -->
### Inputs

| Name | Description | Type | Required |
| ---- | ----------- | ---- | :------: |
| azure_subscription_id | Azure Subscription ID for workshop resources | `string` | yes |
| azure_tenant_id | Azure Tenant ID for workshop resources | `string` | yes |
| tfe_organization_name | HCP Terraform organization name | `string` | yes |
| project_identifier | Name prefix for the workshop project (lowercase, no spaces, alphanumeric and hyphens only) | `string` | no |

### Outputs

| Name | Description |
| ---- | ----------- |
| azure_app_client_id | Azure AD Application Client ID used for OIDC |
| service_principal_object_id | Azure AD Service Principal Object ID |
<!-- END_TF_DOCS -->