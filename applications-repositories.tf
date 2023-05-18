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
        UPSTREAM = "codingones-github-templates/UPSTREAM"
      }
    }
    releaserc = {
      path            = ".releaserc"
      url_of_template = "https://raw.githubusercontent.com/codingones-github-templates/files-templates/main/releaserc/releaserc-ecr"
      template_variables = {
        SERVICE = "api"
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
      path            = ".github/workflows/deploy-on-s3.yml"
      url_of_template = "https://raw.githubusercontent.com/codingones-github-templates/files-templates/main/github-actions/deploy-to-s3.yml"
      template_variables = {
        SERVICE = "s3"
      }
    }
    workflow-sync = {
      path            = ".github/workflows/sync-with-upstream.yml"
      url_of_template = "https://raw.githubusercontent.com/codingones-github-templates/files-templates/main/github-actions/sync-with-upstream.yml"
      template_variables = {
        UPSTREAM = "codingones-github-templates/UPSTREAM"
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