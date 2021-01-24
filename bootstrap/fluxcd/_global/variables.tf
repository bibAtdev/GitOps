/**
 * Ref.: https://github.com/fluxcd/terraform-provider-flux/blob/main/examples/github/variables.tf
 * Due to security reasons the following variables should be set within the system and not directly in the Terraform files
 *   - TF_VAR_github_owner
 *   - TF_VAR_github_token
 *
**/


variable "github_owner" {
  type = string
}

variable "github_token" {
  type = string
}

variable "repository_name" {
  type    = string
  default = "GitOps"
}

variable "repository_visibility" {
  type    = string
  default = "public"
}

variable "branch" {
  type    = string
  default = "main"
}

variable "target_path" {
  type    = string
  default = "non-prod/namespaces"
}
