terraform {
  required_version = ">= 1.14.0, < 2.0.0"

  cloud {
    organization = "a-demo-organization"

    workspaces {
      name = "seattle-hug"
    }
  }

  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = ">= 3.8.0, < 4.0.0"
    }

    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.69.0, < 5.0.0"
    }

    random = {
      source  = "hashicorp/random"
      version = ">= 3.8.0, < 4.0.0"
    }

    tfe = {
      source  = "hashicorp/tfe"
      version = ">= 0.76.0, < 1.0.0"
    }
  }
}
