locals {
  applications_repositories = {
    aws_application_api = {
      github_repository             = "aws-application-api"
      github_repository_topics      = ["api", "node", "aws", "ecr", "docker"]
      github_repository_description = "The necessary resources to deploy a client to ecr"
    },
    aws_application_client = {
      github_repository             = "aws-application-client"
      github_repository_topics      = ["client", "aws", "s3", "cloudfront"]
      github_repository_description = "The necessary resources to deploy a client to s3/cloudfront"
    },
    angular_client = {
      github_repository             = "angular-client"
      github_repository_topics      = ["client", "angular", "template", "cognito"]
      github_repository_description = "A ready to deploy application for quick prototyping"
    },
    fastify_api = {
      github_repository             = "fastify-api"
      github_repository_topics      = ["api", "node", "template", "typescript", "fastify"]
      github_repository_description = "A ready to deploy api for quick prototyping"
    }
  }
}

module "aws_application_repository" {
  for_each = local.applications_repositories

  source = "github.com/codingones-terraform-modules/github-repository"

  github_organization           = "codingones-github-templates"
  github_repository             = each.value.github_repository
  github_repository_topics      = each.value.github_repository_topics
  allow_force_pushes_to_default_branch  = false
  github_repository_description = each.value.github_repository_description

  providers = {
    github = github
  }

  depends_on = [module.github_organization]
}