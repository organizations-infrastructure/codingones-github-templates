locals {
  project = {
    name                         = "codingones-github-templates"
    github_organization          = "codingones-github-templates"
    terraform_cloud_organization = "codingones-github-templates"
    commit_author                = "github-actions[bot]"
    commit_email                 = "github-actions[bot]@users.noreply.github.com"
    organization_email           = "romain.cambonie@gmail.com"
    organization_variables = {
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
    }
  }
}
