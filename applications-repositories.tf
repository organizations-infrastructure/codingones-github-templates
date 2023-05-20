module "aws_application_api" {
  source = "github.com/codingones-terraform-modules/github-repository"

  github_organization           = "codingones-github-templates"
  github_repository             = "aws-application-api"
  github_repository_topics      = ["api", "node", "aws", "ecr", "docker"]
  allow_push_to_default_branch  = false
  github_repository_description = "The necessary resources to deploy a client to ecr"
  #required_context_checks       = ["validate/prettier"]

  providers = {
    github = github
  }

  depends_on = [module.github_organization]
}

module "aws_application_client" {
  source = "github.com/codingones-terraform-modules/github-repository"

  github_organization           = "codingones-github-templates"
  github_repository             = "aws-application-client"
  github_repository_topics      = ["client", "aws", "s3", "cloudfront"]
  allow_push_to_default_branch  = false
  github_repository_description = "The necessary resources to deploy a client to s3/cloudfront"
  #required_context_checks       = ["validate/prettier"]

  providers = {
    github = github
  }

  depends_on = [module.github_organization]
}

module "angular_client" {
  source = "github.com/codingones-terraform-modules/github-repository"

  github_organization           = "codingones-github-templates"
  github_repository             = "angular-client"
  github_repository_topics      = ["client", "angular", "template", "cognito"]
  allow_push_to_default_branch  = false
  github_repository_description = "A ready to deploy application for quick prototyping"
  #required_context_checks       = ["validate/prettier"]

  providers = {
    github = github
  }

  depends_on = [module.github_organization]
}

module "fastify_api" {
  source = "github.com/codingones-terraform-modules/github-repository"

  github_organization           = "codingones-github-templates"
  github_repository             = "fastify-api"
  github_repository_topics      = ["api", "node", "template", "typescript", "fastify"]
  allow_push_to_default_branch  = false
  github_repository_description = "A ready to deploy api for quick prototyping"
  #required_context_checks       = ["validate/prettier"]

  providers = {
    github = github
  }

  depends_on = [module.github_organization]
}