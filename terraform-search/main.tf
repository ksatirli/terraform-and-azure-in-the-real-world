# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform
resource "azurerm_storage_account" "unmanaged_0" {
  provider                          = azurerm
  access_tier                       = "Hot"
  account_kind                      = "StorageV2"
  account_replication_type          = "LRS"
  account_tier                      = "Standard"
  allow_nested_items_to_be_public   = false
  allowed_copy_scope                = null
  cross_tenant_replication_enabled  = false
  default_to_oauth_authentication   = false
  dns_endpoint_type                 = "Standard"
  edge_zone                         = null
  https_traffic_only_enabled        = true
  infrastructure_encryption_enabled = false
  is_hns_enabled                    = false
  large_file_share_enabled          = false
  local_user_enabled                = true
  location                          = "eastus2"
  min_tls_version                   = "TLS1_2"
  name                              = "stdemo30783"
  nfsv3_enabled                     = false
  provisioned_billing_model_version = null
  public_network_access_enabled     = true
  queue_encryption_key_type         = "Service"
  resource_group_name               = "rg-demo"
  sftp_enabled                      = false
  shared_access_key_enabled         = true
  table_encryption_key_type         = "Service"
  tags                              = {}

  share_properties {
    retention_policy {
      days = 7
    }
  }
  timeouts {
    create = null
    delete = null
    read   = null
    update = null
  }
}

import {
  to       = azurerm_storage_account.unmanaged_0
  provider = azurerm
  identity = {
    name                = "stdemo30783"
    resource_group_name = "rg-demo"
    subscription_id     = "1e2e0ac9-54bf-4260-8a30-eb9a175659d4"
  }
}


