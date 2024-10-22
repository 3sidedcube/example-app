terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.72.1"
    }
  }
}

locals {
  client       = "tsc"
  project_name = "example-app"
  environment  = "test"
}

provider "aws" {
  region = "eu-west-1"

  default_tags {
    tags = {
      client      = local.client
      product     = local.project_name
      Environment = local.environment
    }
  }
}

module "crossplane" {
  source = "git@github.com:3sidedcube/terraform-aws-crossplane-access.git?ref=v0.1.6"

  project_name = local.project_name
  environment  = local.environment
}
