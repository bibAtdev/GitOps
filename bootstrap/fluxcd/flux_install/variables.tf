variable "target_path" {
  type        = string
  default     = "non-prod/namespaces"
  description = "flux install target path"
}

variable "components_extra" {
  type        = list(string)
  default     =  []
  description = "extra flux components"
}