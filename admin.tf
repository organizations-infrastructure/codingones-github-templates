module "terraform_cloud_organization" {
  source = "./modules/terraform-cloud-organization"

  terraform_organization = local.project.terraform_cloud_organization
  organization_email     = local.project.organization_email
  project                = local.project.name
  organization_variables = local.project.terraform_organization_variables

  providers = {
    tfe = tfe
  }
}

module "github_organization" {
  source = "github.com/codingones-terraform-modules/github-organization"

  terraform_organization        = local.project.terraform_cloud_organization
  github_organization_secrets   = local.project.github_organization_secrets
  github_organization_variables = local.project.github_organization_variables

  providers = {
    github = github
    tfe    = tfe
  }

  depends_on = [module.terraform_cloud_organization]
}