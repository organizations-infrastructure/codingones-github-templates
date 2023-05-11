terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "organizations-infrastructure"

    workspaces {
      name = "codingones-github-templates"
    }
  }

  required_providers {
    github = {
      source  = "integrations/github"
      version = ">= 5.20"
    }
    tfe = {
      source  = "hashicorp/tfe"
      version = ">= 0.43"
    }
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.61"
    }
    http = {
      source  = "hashicorp/http"
      version = ">= 3.2.1"
    }
  }
}

provider "tfe" {
  token = var.tfe_token
}

provider "github" {
  token = var.github_token
  owner = local.project.github_organization
}