module "aws_service_repository" {
  for_each = local.services_repositories

  source = "github.com/codingones-terraform-modules/aws-service-infrastructure-template-repository-generator"

  service                              = each.value.service
  github_organization                  = each.value.github_organization
  github_repository                    = each.value.github_repository
  files                                = each.value.files
  allow_force_pushes_to_default_branch = true

  providers = {
    github = github
  }

  depends_on = [module.github_organization]
}

locals {
  services_repositories = {
    vpc = {
      service             = "vpc"
      github_organization = "codingones-github-templates"
      github_repository   = "aws-service-vpc"
      files = {
        workflow-apply = {
          path            = ".github/workflows/apply.terraform.yml"
          url_of_template = "https://raw.githubusercontent.com/codingones-github-templates/files-templates/main/github-actions/apply-terraform-aws-service-infrastructure.yml"
          template_variables = {
            __SERVICE = "vpc-infrastructure"
          }
        },
        workflow-sync = {
          path            = ".github/workflows/sync-with-upstream.yml"
          url_of_template = "https://raw.githubusercontent.com/codingones-github-templates/files-templates/main/github-actions/sync-with-upstream.yml"
          template_variables = {
            __UPSTREAM = "codingones-github-templates/aws-service-vpc"
          }
        },
        outputs = {
          path               = "outputs.tf"
          url_of_template    = "https://raw.githubusercontent.com/codingones-github-templates/files-templates/main/terraform/service/vpc/outputs.tf"
          template_variables = {}
        },
        vpc = {
          path               = "vpc.tf"
          url_of_template    = "https://raw.githubusercontent.com/codingones-github-templates/files-templates/main/terraform/service/vpc/vpc.tf"
          template_variables = {}
        }
      }
    },
    domain = {
      service             = "domain"
      github_organization = "codingones-github-templates"
      github_repository   = "aws-service-domain"
      files = {
        workflow-apply = {
          path            = ".github/workflows/apply.terraform.yml"
          url_of_template = "https://raw.githubusercontent.com/codingones-github-templates/files-templates/main/github-actions/apply-terraform-aws-service-infrastructure.yml"
          template_variables = {
            __SERVICE = "domain-infrastructure"
          }
        },
        workflow-sync = {
          path            = ".github/workflows/sync-with-upstream.yml"
          url_of_template = "https://raw.githubusercontent.com/codingones-github-templates/files-templates/main/github-actions/sync-with-upstream.yml"
          template_variables = {
            __UPSTREAM = "codingones-github-templates/aws-service-domain"
          }
        },
        acm = {
          path               = "acm.tf"
          url_of_template    = "https://raw.githubusercontent.com/codingones-github-templates/files-templates/main/terraform/service/domain/acm.tf"
          template_variables = {}
        },
        outputs = {
          path               = "outputs.tf"
          url_of_template    = "https://raw.githubusercontent.com/codingones-github-templates/files-templates/main/terraform/service/domain/outputs.tf"
          template_variables = {}
        },
        route53 = {
          path               = "route53.tf"
          url_of_template    = "https://raw.githubusercontent.com/codingones-github-templates/files-templates/main/terraform/service/domain/route53.tf"
          template_variables = {}
        }
      }
    },
    email = {
      service             = "email"
      github_organization = "codingones-github-templates"
      github_repository   = "aws-service-email"
      files = {
        workflow-apply = {
          path            = ".github/workflows/apply.terraform.yml"
          url_of_template = "https://raw.githubusercontent.com/codingones-github-templates/files-templates/main/github-actions/apply-terraform-aws-service-infrastructure.yml"
          template_variables = {
            __SERVICE = "email-infrastructure"
          }
        },
        workflow-sync = {
          path            = ".github/workflows/sync-with-upstream.yml"
          url_of_template = "https://raw.githubusercontent.com/codingones-github-templates/files-templates/main/github-actions/sync-with-upstream.yml"
          template_variables = {
            __UPSTREAM = "codingones-github-templates/aws-service-email"
          }
        },
        iam = {
          path               = "iam.tf"
          url_of_template    = "https://raw.githubusercontent.com/codingones-github-templates/files-templates/main/terraform/service/email/iam.tf"
          template_variables = {}
        },
        lambda = {
          path               = "lambda.tf"
          url_of_template    = "https://raw.githubusercontent.com/codingones-github-templates/files-templates/main/terraform/service/email/lambda.tf"
          template_variables = {}
        },
        outputs = {
          path               = "outputs.tf"
          url_of_template    = "https://raw.githubusercontent.com/codingones-github-templates/files-templates/main/terraform/service/email/outputs.tf"
          template_variables = {}
        },
        route53 = {
          path               = "route53.tf"
          url_of_template    = "https://raw.githubusercontent.com/codingones-github-templates/files-templates/main/terraform/service/email/route53.tf"
          template_variables = {}
        },
        s3 = {
          path               = "s3.tf"
          url_of_template    = "https://raw.githubusercontent.com/codingones-github-templates/files-templates/main/terraform/service/email/s3.tf"
          template_variables = {}
        },
        ses = {
          path               = "ses.tf"
          url_of_template    = "https://raw.githubusercontent.com/codingones-github-templates/files-templates/main/terraform/service/email/ses.tf"
          template_variables = {}
        }
      }
    },
    identity = {
      service             = "identity"
      github_organization = "codingones-github-templates"
      github_repository   = "aws-service-identity"
      files = {
        workflow-apply = {
          path            = ".github/workflows/apply.terraform.yml"
          url_of_template = "https://raw.githubusercontent.com/codingones-github-templates/files-templates/main/github-actions/apply-terraform-aws-service-infrastructure.yml"
          template_variables = {
            __SERVICE = "identity-infrastructure"
          }
        },
        workflow-sync = {
          path            = ".github/workflows/sync-with-upstream.yml"
          url_of_template = "https://raw.githubusercontent.com/codingones-github-templates/files-templates/main/github-actions/sync-with-upstream.yml"
          template_variables = {
            __UPSTREAM = "codingones-github-templates/aws-service-identity"
          }
        },
        cognito = {
          path               = "cognito.tf"
          url_of_template    = "https://raw.githubusercontent.com/codingones-github-templates/files-templates/main/terraform/service/identity/cognito.tf"
          template_variables = {}
        },
        iam = {
          path               = "iam.tf"
          url_of_template    = "https://raw.githubusercontent.com/codingones-github-templates/files-templates/main/terraform/service/identity/iam.tf"
          template_variables = {}
        },
        outputs = {
          path               = "outputs.tf"
          url_of_template    = "https://raw.githubusercontent.com/codingones-github-templates/files-templates/main/terraform/service/identity/outputs.tf"
          template_variables = {}
        },
        sns = {
          path               = "sns.tf"
          url_of_template    = "https://raw.githubusercontent.com/codingones-github-templates/files-templates/main/terraform/service/identity/sns.tf"
          template_variables = {}
        }
      }
    },
    persistence = {
      service             = "persistence"
      github_organization = "codingones-github-templates"
      github_repository   = "aws-service-persistence"
      files = {
        workflow-apply = {
          path            = ".github/workflows/apply.terraform.yml"
          url_of_template = "https://raw.githubusercontent.com/codingones-github-templates/files-templates/main/github-actions/apply-terraform-aws-service-infrastructure.yml"
          template_variables = {
            __SERVICE = "persistence-infrastructure"
          }
        }
        workflow-sync = {
          path            = ".github/workflows/sync-with-upstream.yml"
          url_of_template = "https://raw.githubusercontent.com/codingones-github-templates/files-templates/main/github-actions/sync-with-upstream.yml"
          template_variables = {
            __UPSTREAM = "codingones-github-templates/aws-service-persistence"
          }
        }
        outputs = {
          path               = "outputs.tf"
          url_of_template    = "https://raw.githubusercontent.com/codingones-github-templates/files-templates/main/terraform/service/persistence/outputs.tf"
          template_variables = {}
        }
        rds = {
          path               = "rds.tf"
          url_of_template    = "https://raw.githubusercontent.com/codingones-github-templates/files-templates/main/terraform/service/persistence/rds.tf"
          template_variables = {}
        }
        vpc = {
          path               = "vpc.tf"
          url_of_template    = "https://raw.githubusercontent.com/codingones-github-templates/files-templates/main/terraform/service/persistence/vpc.tf"
          template_variables = {}
        }
      }
    },
    registry = {
      service             = "registry"
      github_organization = "codingones-github-templates"
      github_repository   = "aws-service-registry"
      files = {
        workflow-apply = {
          path            = ".github/workflows/apply.terraform.yml"
          url_of_template = "https://raw.githubusercontent.com/codingones-github-templates/files-templates/main/terraform/service/registry/apply-terraform-aws-registry-infrastructure.yml"
          template_variables = {
            __SERVICE = "registry-infrastructure"
          }
        }
        workflow-sync = {
          path            = ".github/workflows/sync-with-upstream.yml"
          url_of_template = "https://raw.githubusercontent.com/codingones-github-templates/files-templates/main/github-actions/sync-with-upstream.yml"
          template_variables = {
            __UPSTREAM = "codingones-github-templates/aws-service-registry"
          }
        }
        ecr = {
          path               = "ecr.tf"
          url_of_template    = "https://raw.githubusercontent.com/codingones-github-templates/files-templates/main/terraform/service/registry/ecr.tf"
          template_variables = {}
        }
        outputs = {
          path               = "outputs.tf"
          url_of_template    = "https://raw.githubusercontent.com/codingones-github-templates/files-templates/main/terraform/service/registry/outputs.tf"
          template_variables = {}
        }
      }
    },
    api = {
      service             = "api"
      github_organization = "codingones-github-templates"
      github_repository   = "aws-service-api"
      files = {
        workflow-apply = {
          path            = ".github/workflows/apply.terraform.yml"
          url_of_template = "https://raw.githubusercontent.com/codingones-github-templates/files-templates/main/terraform/service/api/apply-terraform-aws-api-infrastructure.yml"
          template_variables = {
            __SERVICE = "api-infrastructure"
          }
        }
        workflow-sync = {
          path            = ".github/workflows/sync-with-upstream.yml"
          url_of_template = "https://raw.githubusercontent.com/codingones-github-templates/files-templates/main/github-actions/sync-with-upstream.yml"
          template_variables = {
            __UPSTREAM = "codingones-github-templates/aws-service-api"
          }
        },
        alb = {
          path               = "alb.tf"
          url_of_template    = "https://raw.githubusercontent.com/codingones-github-templates/files-templates/main/terraform/service/api/alb.tf"
          template_variables = {}
        },
        api-gateway = {
          path               = "api-gateway.tf"
          url_of_template    = "https://raw.githubusercontent.com/codingones-github-templates/files-templates/main/terraform/service/api/api-gateway.tf"
          template_variables = {}
        },
        ecs = {
          path               = "ecs.tf"
          url_of_template    = "https://raw.githubusercontent.com/codingones-github-templates/files-templates/main/terraform/service/api/ecs.tf"
          template_variables = {}
        },
        iam = {
          path               = "iam.tf"
          url_of_template    = "https://raw.githubusercontent.com/codingones-github-templates/files-templates/main/terraform/service/api/iam.tf"
          template_variables = {}
        },
        outputs = {
          path               = "outputs.tf"
          url_of_template    = "https://raw.githubusercontent.com/codingones-github-templates/files-templates/main/terraform/service/api/outputs.tf"
          template_variables = {}
        },
        vpc = {
          path               = "vpc.tf"
          url_of_template    = "https://raw.githubusercontent.com/codingones-github-templates/files-templates/main/terraform/service/api/vpc.tf"
          template_variables = {}
        }
      }
    },
    client = {
      service             = "client"
      github_organization = "codingones-github-templates"
      github_repository   = "aws-service-client"
      files = {
        workflow-apply = {
          path            = ".github/workflows/apply.terraform.yml"
          url_of_template = "https://raw.githubusercontent.com/codingones-github-templates/files-templates/main/github-actions/apply-terraform-aws-service-infrastructure.yml"
          template_variables = {
            __SERVICE = "client-infrastructure"
          }
        },
        workflow-sync = {
          path            = ".github/workflows/sync-with-upstream.yml"
          url_of_template = "https://raw.githubusercontent.com/codingones-github-templates/files-templates/main/github-actions/sync-with-upstream.yml"
          template_variables = {
            __UPSTREAM = "codingones-github-templates/aws-service-client"
          }
        },
        cloudfront = {
          path               = "cloudfront.tf"
          url_of_template    = "https://raw.githubusercontent.com/codingones-github-templates/files-templates/main/terraform/service/client/cloudfront.tf"
          template_variables = {}
        },
        outputs = {
          path               = "outputs.tf"
          url_of_template    = "https://raw.githubusercontent.com/codingones-github-templates/files-templates/main/terraform/service/client/outputs.tf"
          template_variables = {}
        },
        route53 = {
          path               = "route53.tf"
          url_of_template    = "https://raw.githubusercontent.com/codingones-github-templates/files-templates/main/terraform/service/client/route53.tf"
          template_variables = {}
        },
        s3 = {
          path               = "s3.tf"
          url_of_template    = "https://raw.githubusercontent.com/codingones-github-templates/files-templates/main/terraform/service/client/s3.tf"
          template_variables = {}
        }
      }
    }
  }
}