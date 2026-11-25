terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
    # github = {
    #   source  = "integrations/github"
    #   version = "~> 6.0"
    # }
  }
}

provider "aws" {
  region                   = "us-east-1"
  shared_credentials_files = [var.emulator_credentials_path]
  profile                  = "default"
  
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    ec2 = "https://127.0.0.1:9297"
    s3  = "https://127.0.0.1:9297"
    iam = "https://127.0.0.1:9297"
    sts = "https://127.0.0.1:9297"
  }
}

# provider "github" {
#    token = "TOKEN" # or `var.github_token or GITHUB_TOKEN`
# }

module "aws" {
  source = "./aws"

  app_port = var.app_port
  ssh_port = var.ssh_port
  vpn_ip   = var.vpn_ip
}

# module "github" {
#   source = "./github"
# }