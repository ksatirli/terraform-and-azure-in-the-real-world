provider "azuread" {
  tenant_id = var.azure_tenant_id
}

provider "azurerm" {
  features {}
  resource_provider_registrations = "none"
  subscription_id                 = var.azure_subscription_id
  tenant_id                       = var.azure_tenant_id
}

provider "tfe" {}
