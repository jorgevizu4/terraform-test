terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
}

provider "github" {
   token = "TOKEN" # or `var.github_token or GITHUB_TOKEN`
}

module "aws" {
  source = "./aws"
}