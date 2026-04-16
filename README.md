# HCP Terraform Workshop Management

> Admin workspace that provisions complete workshop environments: per-attendee HCP Terraform workspaces, GitHub repos, Azure OIDC identity, and Sentinel governance policies.

## Table of Contents

<!-- TOC -->
* [Table of Contents](#table-of-contents)
* [Requirements](#requirements)
* [Usage](#usage)
* [Inputs](#inputs)
* [Outputs](#outputs)
* [Architecture](#architecture)
* [Notes](#notes)
* [Contributors](#contributors)
* [License](#license)
<!-- TOC -->

## Requirements

* HashiCorp Cloud Platform (HCP) [Account](https://portal.cloud.hashicorp.com/sign-in)
* HashiCorp HCP Terraform [Account](https://app.terraform.io/session)
* HashiCorp Terraform `1.x` or [newer](https://developer.hashicorp.com/terraform/downloads)
* Azure AD [Account](https://portal.azure.com/)
* Azure [Account](https://portal.azure.com/)
* GitHub Organization with [admin access](https://github.com/settings/organizations)

### Development

* `terraform-docs` `0.21.0` or [newer](https://terraform-docs.io/user-guide/installation/)
* `tflint` `0.61.0` or [newer](https://github.com/terraform-linters/tflint)
* [Task](https://taskfile.dev/) `3.x` or newer

## Usage

This workspace provisions isolated workshop environments for each attendee. It creates GitHub repos from a template, HCP Terraform workspaces with VCS integration, and Azure OIDC authentication — all driven by `attendee_count` and `attendee_github_usernames`.

This repository provides a [Taskfile](./Taskfile.yml)-based workflow. Run `task --list` to see available commands.

<!-- BEGIN_TF_DOCS -->
### Inputs

| Name | Description | Type | Required |
|------|-------------|------|:--------:|
| azure_subscription_id | Azure Subscription ID for workshop resources | `string` | yes |
| azure_tenant_id | Azure Tenant ID for workshop resources | `string` | yes |
| github_organization | GitHub organization for workshop repos | `string` | yes |
| github_template_repo_name | Name of the template repository | `string` | yes |
| github_token | GitHub personal access token for HCP Terraform VCS integration | `string` | yes |
| tfe_organization_name | HCP Terraform organization name | `string` | yes |
| workshop_attendees_github | List of GitHub usernames for workshop attendees | `list(string)` | yes |
| github_template_repo_branch | Default branch of the template repository | `string` | no |
| project_identifier | Name prefix for the workshop project (lowercase, no spaces, alphanumeric and hyphens only) | `string` | no |

### Outputs

| Name | Description |
|------|-------------|
| attendee_repos | Map of attendee keys to GitHub repository URLs |
| azure_app_client_id | Azure AD Application Client ID used for OIDC |
| github_team_slug | GitHub team slug for workshop attendees |
| service_principal_object_id | Azure AD Service Principal Object ID |
| workspace_names | Map of attendee keys to HCP Terraform workspace names |
| workspace_urls | Map of attendee keys to HCP Terraform workspace URLs |
<!-- END_TF_DOCS -->

## Notes

**OIDC federated credentials are per-workspace, per-phase.**
Azure OIDC requires exact subject match - no wildcards. Each attendee gets two credentials (plan + apply).
Adding attendees requires applying this workspace before their HCP Terraform runs can authenticate to Azure.

**`project_identifier` validation**
must be lowercase alphanumeric with hyphens. No spaces, no uppercase.
Used in resource names across Azure, GitHub, and HCP Terraform.

## Contributors

For a list of current (and past) contributors to this repository, see [GitHub](https://github.com/ksatirli/terraform-and-azure-in-the-real-world/graphs/contributors).

## License

Licensed under the Apache License, Version 2.0 (the "License").

You may download a copy of the License at [apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0).

See the License for the specific language governing permissions and limitations under the License.
