# Dynamic Provider Credentials

Upstream Documentation: [developer.hashicorp.com](https://developer.hashicorp.com/terraform/cloud-docs/dynamic-provider-credentials)

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
