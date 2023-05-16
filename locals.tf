locals {
  project = {
    name                         = "codingones-github-templates"
    github_organization          = "codingones-github-templates"
    terraform_cloud_organization = "codingones-github-templates"
    commit_author                = "github-actions[bot]"
    commit_email                 = "github-actions[bot]@users.noreply.github.com"
    organization_email           = "romain.cambonie@gmail.com"
    terraform_organization_variables = {
      "project" = {
        hcl         = false
        sensitive   = false
        value       = "codingones-github-templates"
        description = "The project name in the Project-Service-Layer architecture"
      }
      "terraform_organization" = {
        hcl         = false
        sensitive   = false
        value       = "codingones-github-templates"
        description = "The organization name on terraform cloud"
      }
      "github_pat" = {
        hcl         = false
        sensitive   = false
        value       = var.github_pat
        description = "A github PAT that allow administration operation on repositories"
      }
    }
    github_organization_secrets = {
      "tfe_team_token" = {
        github_key    = "TF_API_TOKEN"
        terraform_key = "tfe_team_token"
      }
      "github_pat" = {
        github_key    = "PAT"
        terraform_key = "github_pat"
      }
    }
    github_organization_variables = {
    }
  }
}
