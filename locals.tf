locals {
  project = {
    name                          = "codingones-github-templates"
    github_organization           = "codingones-github-templates"
    terraform_cloud_organization  = "codingones-github-templates"
    aws_organizational_unit       = "none"
    commit_author                 = "github-actions[bot]"
    commit_email                  = "github-actions[bot]@users.noreply.github.com"
    organization_email            = "romain.cambonie@gmail.com"
    aws_root_id                   = "3"
    aws_management_account        = "ma"
    aws_management_email          = "romain.cambonie@gmail.com"
    organization_variables = {
      "project" = {
        hcl         = false
        sensitive   = false
        value       = codingones-github-templates
        description = "The project name in the Project-Service-Layer architecture"
      }
      "terraform_organization" = {
        hcl         = false
        sensitive   = false
        value       = "codingones-github-templates"
        description = "The organization name on terraform cloud"
      }
      "domain_name" = {
        hcl         = false
        sensitive   = false
        value       = "DOMAIN"
        description = "The registered domain name (does not need to be registered yet but check availability)"
      }
      "sender_id" = {
        hcl         = false
        sensitive   = false
        value       = "SENDER_ID"
        description = "Sender id for transactional sms (auth). Maximum 11 alphanumeric or hyphen (-) characters, including at least one letter and no spaces. It has to start and end with an alphanumeric character."
      }
      "domain_email_forward_addresses" = {
        hcl         = false
        sensitive   = false
        value       = "['EMAIL_1','EMAIL_2']"
        description = "The emails addresses to forward the emails sent to the SES verified domain"
      }
    }
  }
}
