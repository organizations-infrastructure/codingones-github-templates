variable "github_token" {
  description = "Your GitHub Personal Access Token"
  nullable    = false
  default     = false
  sensitive   = true
}

variable "tfe_token" {
  description = "Your TFE Personal Token"
  nullable    = false
  default     = false
  sensitive   = true
}

variable "github_pat" {
  description = "A GitHub Personal Access Token from the admin"
  nullable    = false
  default     = false
  sensitive   = true
}