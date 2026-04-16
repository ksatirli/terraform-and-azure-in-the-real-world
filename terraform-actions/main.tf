# see https://registry.terraform.io/providers/hashicorp/azurerm/4.69.0/docs/resources/cdn_frontdoor_profile
resource "azurerm_cdn_frontdoor_profile" "main" {
  name                     = "cdn-profile"
  resource_group_name      = data.azurerm_resource_group.main.name
  sku_name                 = "Premium_AzureFrontDoor"
  response_timeout_seconds = 120

  identity {
    type = "SystemAssigned, UserAssigned"

    identity_ids = [
      azurerm_user_assigned_identity.main.id
    ]
  }

  log_scrubbing_rule {
    match_variable = "RequestIPAddress"
  }

  tags = {
    environment = "Production"
  }
}

# see https://registry.terraform.io/providers/hashicorp/azurerm/4.69.0/docs/resources/cdn_frontdoor_endpoint
resource "azurerm_cdn_frontdoor_endpoint" "main" {
  name                     = "main"
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.main.id
}
