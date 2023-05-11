module "aws_service_vpc_template" {
  source = "github.com/codingones-terraform-modules/aws-service-infrastructure-template-repository-generator"

  service             = "vpc"
  github_organization = "codingones-github-templates"
  github_repository   = "aws-service-vpc"

  files = {
    workflow_apply = {
      path            = ".github/workflows/apply.terraform.yml"
      url_of_template = "https://raw.githubusercontent.com/codingones-github-templates/files-templates/main/github-actions/apply-terraform-aws-service-infrastructure.yml"
      template_variables = {
        SERVICE = "vpc-infrastructure"
      }
    }
    workflow_sync = {
      path            = ".github/workflows/sync-with-upstream.yml"
      url_of_template = "https://raw.githubusercontent.com/codingones-github-templates/files-templates/main/github-actions/sync-with-upstream.yml"
      template_variables = {
        UPSTREAM = "codingones-github-templates/aws-service-vpc"
      }
    }
    vpc = {
      path               = "vpc.tf"
      url_of_template    = "https://raw.githubusercontent.com/codingones-github-templates/files-templates/main/main/terraform/service/vpc/vpc.tf"
      template_variables = {}
    },
    outputs = {
      path               = "outputs.tf"
      url_of_template    = "https://raw.githubusercontent.com/codingones-github-templates/files-templates/main/terraform/service/vpc/outputs.tf"
      template_variables = {}
    }
  }

  providers = {
    github = github
  }
}