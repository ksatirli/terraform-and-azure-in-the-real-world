# see https://registry.terraform.io/providers/hashicorp/tfe/0.76.1/docs/data-sources/organization
data "tfe_organization" "main" {
  name = var.tfe_organization_name
}

# see https://registry.terraform.io/providers/hashicorp/tfe/0.76.1/docs/resources/project
resource "tfe_project" "main" {
  name         = var.project_identifier
  organization = data.tfe_organization.main.name
}

# see https://registry.terraform.io/providers/hashicorp/tfe/0.76.1/docs/resources/workspace
resource "tfe_workspace" "main" {
  auto_apply     = true
  force_delete   = true
  name           = var.project_identifier
  organization   = data.tfe_organization.main.name
  project_id     = tfe_project.main.id
  queue_all_runs = false
}

# see https://registry.terraform.io/providers/hashicorp/tfe/0.76.1/docs/resources/variable_set
resource "tfe_variable_set" "main" {
  description  = "Azure OIDC credentials for dynamic provider authentication"
  name         = "${var.project_identifier}-azure-oidc-credentials"
  organization = data.tfe_organization.main.name
}

# see https://registry.terraform.io/providers/hashicorp/tfe/0.76.1/docs/resources/project_variable_set
resource "tfe_project_variable_set" "main" {
  project_id      = tfe_project.main.id
  variable_set_id = tfe_variable_set.main.id
}

# see https://registry.terraform.io/providers/hashicorp/tfe/0.76.1/docs/resources/variable
resource "tfe_variable" "tfc_azure_provider_auth" {
  category        = "env"
  description     = "Enable Azure OIDC authentication"
  key             = "TFC_AZURE_PROVIDER_AUTH"
  value           = "true"
  variable_set_id = tfe_variable_set.main.id
}

# see https://registry.terraform.io/providers/hashicorp/tfe/0.76.1/docs/resources/variable
resource "tfe_variable" "tfc_azure_run_client_id" {
  category        = "env"
  description     = "Azure AD Application Client ID for OIDC"
  key             = "TFC_AZURE_RUN_CLIENT_ID"
  value           = azuread_application.main.client_id
  variable_set_id = tfe_variable_set.main.id
}

# see https://registry.terraform.io/providers/hashicorp/tfe/0.76.1/docs/resources/variable
resource "tfe_variable" "arm_subscription_id" {
  category        = "env"
  description     = "Azure Subscription ID"
  key             = "ARM_SUBSCRIPTION_ID"
  value           = var.azure_subscription_id
  variable_set_id = tfe_variable_set.main.id
}

# see https://registry.terraform.io/providers/hashicorp/tfe/0.76.1/docs/resources/variable
resource "tfe_variable" "arm_tenant_id" {
  category        = "env"
  description     = "Azure Tenant ID"
  key             = "ARM_TENANT_ID"
  value           = var.azure_tenant_id
  variable_set_id = tfe_variable_set.main.id
}
