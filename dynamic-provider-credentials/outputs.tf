output "azure_app_client_id" {
  description = "Azure AD Application Client ID used for OIDC"
  value       = azuread_application.main.client_id
}

output "service_principal_object_id" {
  description = "Azure AD Service Principal Object ID"
  value       = azuread_service_principal.main.object_id
}
