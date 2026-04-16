# see https://registry.terraform.io/providers/hashicorp/azurerm/4.69.0/docs/data-sources/subscription
data "azurerm_subscription" "main" {}

# see https://registry.terraform.io/providers/hashicorp/azuread/3.8.0/docs/data-sources/client_config
data "azuread_client_config" "main" {}

# see https://registry.terraform.io/providers/hashicorp/azuread/3.8.0/docs/resources/application
resource "azuread_application" "main" {
  display_name = "hcp-terraform-${var.project_identifier}"

  owners = [
    data.azuread_client_config.main.object_id
  ]
}

# see https://registry.terraform.io/providers/hashicorp/azuread/3.8.0/docs/resources/service_principal
resource "azuread_service_principal" "main" {
  client_id = azuread_application.main.client_id

  owners = [
    data.azuread_client_config.main.object_id
  ]
}

# see https://registry.terraform.io/providers/hashicorp/azuread/3.8.0/docs/resources/application_federated_identity_credential
resource "azuread_application_federated_identity_credential" "main" {
  application_id = azuread_application.main.id

  audiences = [
    "api://AzureADTokenExchange"
  ]

  display_name = "hcp-terraform-${var.project_identifier}-seattlehug"
  issuer       = "https://app.terraform.io"
  subject      = "organization:${var.tfe_organization_name}:project:${tfe_project.main.name}:workspace:seattlehug:run_phase:${each.value.phase}"
}

# see https://registry.terraform.io/providers/hashicorp/azurerm/4.69.0/docs/resources/role_assignment
resource "azurerm_role_assignment" "main" {
  principal_id         = azuread_service_principal.main.object_id
  role_definition_name = "Contributor"
  scope                = data.azurerm_subscription.main.id
}
