# Terraform and Azure in The Real World

> Dynamic Provider Credentials, Ephemeral Resources, Terraform Actions, and Terraform Search

## Table of Contents

<!-- TOC -->
* [Table of Contents](#table-of-contents)
* [Requirements](#requirements)
* [Notes](#notes)
* [Contributors](#contributors)
* [License](#license)
<!-- TOC -->

## Requirements

* HashiCorp Cloud Platform (HCP) [Account](https://portal.cloud.hashicorp.com/sign-in)
* HashiCorp HCP Terraform [Account](https://app.terraform.io/session)
* HashiCorp Terraform `1.14.x` or [newer](https://developer.hashicorp.com/terraform/downloads)
* Azure AD [Account](https://portal.azure.com/)
* Azure [Account](https://portal.azure.com/)

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
