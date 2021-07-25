/**
 * Ref.: https://github.com/fluxcd/terraform-provider-flux/blob/main/examples/github/variables.tf
 * Due to security reasons the following variables should be set within the system and not directly in the Terraform files
 *   - TF_VAR_github_owner
 *   - TF_VAR_github_token
 *
**/

variable "github_owner" {
  type        = string
  description = "github owner"
}

variable "github_token" {
  type        = string
  description = "github token"
}

variable "repository_name" {
  type        = string
  default     = "GitOps"
  description = "github repository name"
}

variable "repository_visibility" {
  type        = string
  default     = "public"
  description = "How visiable is the github repo"
}

variable "branch" {
  type        = string
  default     = "main"
  description = "branch name"
}

variable "target_path" {
  type    = string
  default = "non-prod/namespaces"
  description = "flux sync target path"
}
