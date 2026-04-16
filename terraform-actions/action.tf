# see https://registry.terraform.io/providers/hashicorp/Azurerm/4.69.0/docs/actions/front_door_cache_purge
action "azurerm_cdn_front_door_cache_purge" "main" {
  config {
    front_door_endpoint_id = azurerm_cdn_frontdoor_endpoint.main.id

    content_paths = [
      "/*"
    ]
  }
}

# see https://developer.hashicorp.com/terraform/language/resources/terraform-data
resource "terraform_data" "purge_cdn" {
  input = "purge_cdn"

  lifecycle {
    action_trigger {
      actions = [
        action.azurerm_cdn_front_door_cache_purge.main
      ]

      events = [
        after_update
      ]
    }
  }
}
