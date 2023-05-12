module "aws_application_fastify_api" {
  source = "github.com/codingones-terraform-modules/aws-ecr-node-api-template-repository-generator"

  service             = "ecr"
  github_organization = "codingones-github-templates"
  github_repository   = "aws-application-api-fastify"

  files = {
    workflow-apply = {
      path            = ".github/workflows/release-to-ecr.yml"
      url_of_template = "https://raw.githubusercontent.com/codingones-github-templates/files-templates/main/github-actions/build-and-release-to-ecr.docker.yml"
      template_variables = {
        SERVICE = "ecr"
      }
    }
    workflow-sync = {
      path            = ".github/workflows/sync-with-upstream.yml"
      url_of_template = "https://raw.githubusercontent.com/codingones-github-templates/files-templates/main/github-actions/sync-with-upstream.yml"
      template_variables = {
        UPSTREAM = "codingones-github-templates/aws-application-api-fastify"
      }
    }
  }

  providers = {
    github = github
  }
}