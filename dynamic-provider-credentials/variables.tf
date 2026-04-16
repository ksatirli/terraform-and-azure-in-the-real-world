variable "azure_subscription_id" {
  description = "Azure Subscription ID for workshop resources"
  type        = string
}

variable "azure_tenant_id" {
  description = "Azure Tenant ID for workshop resources"
  type        = string
}

variable "tfe_organization_name" {
  description = "HCP Terraform organization name"
  type        = string
}

variable "project_identifier" {
  default     = "workshop"
  description = "Name prefix for the workshop project (lowercase, no spaces, alphanumeric and hyphens only)"
  type        = string

  validation {
    condition     = can(regex("^[a-z0-9][a-z0-9-]*[a-z0-9]$", var.project_identifier))
    error_message = "Must be lowercase alphanumeric with hyphens, cannot start or end with a hyphen."
  }
}
