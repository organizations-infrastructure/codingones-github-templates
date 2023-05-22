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
      "notification_webhook_failures" = {
        hcl         = false
        sensitive   = false
        value       = var.notification_webhook_failures
        description = "A webhook url to notify about deployments"
      }
      "notification_webhook_successes" = {
        hcl         = false
        sensitive   = false
        value       = var.notification_webhook_successes
        description = "A webhook url to notify about deployments"
      }
      "notification_webhook_releases" = {
        hcl         = false
        sensitive   = false
        value       = var.notification_webhook_releases
        description = "A webhook url to notify about deployments"
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
      "notification_webhook_failures" = {
        github_key    = "DISCORD_FAILURES_WEBHOOK"
        terraform_key = "notification_webhook_failures"
      }
      "notification_webhook_successes" = {
        github_key    = "DISCORD_SUCCESSES_WEBHOOK"
        terraform_key = "notification_webhook_successes"
      }
      "notification_webhook_releases" = {
        github_key    = "DISCORD_RELEASES_WEBHOOK"
        terraform_key = "notification_webhook_releases"
      }
    }
    github_organization_variables = {
    }
  }
}
