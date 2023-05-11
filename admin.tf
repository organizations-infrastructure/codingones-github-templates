module "terraform_cloud" {
  source = "./modules/terraform-cloud-organization"

  terraform_organization = local.project.terraform_cloud_organization
  organization_email     = local.project.organization_email
  project                = local.project.name
  organization_variables = local.project.organization_variables

  providers = {
    tfe = tfe
  }

}

module "github_organization_variables" {
  source = "github.com/codingones-terraform-modules/github-organization"

  tfe_team_token = module.terraform_cloud.tfe_team_token

  providers = {
    github = github
  }

  depends_on = [module.terraform_cloud]
}