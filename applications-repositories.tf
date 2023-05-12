module "aws_application_api" {
  source = "github.com/codingones-terraform-modules/aws-ecr-node-api-template-repository-generator"

  service                  = "ecr"
  github_organization      = "codingones-github-templates"
  github_repository        = "aws-application-api"
  github_repository_topics = ["api", "node", "aws", "ecr", "docker", "template"]

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

  depends_on = [module.github_organization]
}

module "aws_application_client" {
  source = "github.com/codingones-terraform-modules/aws-client-template-repository-generator"

  service                  = "s3"
  github_organization      = "codingones-github-templates"
  github_repository        = "aws-application-client"
  github_repository_topics = ["client", "aws", "s3", "template"]

  files = {
    workflow-deploy = {
      path            = ".github/workflows/deploy-to-s3.yml"
      url_of_template = "https://raw.githubusercontent.com/codingones-github-templates/files-templates/main/github-actions/deploy-to-s3.yml"
      template_variables = {
        SERVICE = "s3"
      }
    }
    workflow-sync = {
      path            = ".github/workflows/sync-with-upstream.yml"
      url_of_template = "https://raw.githubusercontent.com/codingones-github-templates/files-templates/main/github-actions/sync-with-upstream.yml"
      template_variables = {
        UPSTREAM = "codingones-github-templates/aws-application-client-angular"
      }
    }
    workflow-validate = {
      path               = ".github/workflows/validate.yml"
      url_of_template    = "https://raw.githubusercontent.com/codingones-github-templates/files-templates/main/github-actions/validate.yml"
      template_variables = {}
    }
  }

  providers = {
    github = github
  }

  depends_on = [module.github_organization]
}