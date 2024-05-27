#This Terraform Code Deploys Basic VPC Infra.
provider "aws" {
    region = var.aws_region
    profile = var.profile
}

provider "aws" {
  alias = "dns"
  region = "us-east-1"
  assume_role {
  role_arn = "arn:aws:iam::721834156908:role/awsb59-cross-account-role"
  }
}

terraform {
  required_version = "<= 2.3.14"
  required_providers {
    aws = {
      version = "<= 6.0.0"
      source = "hashicorp/aws"
    }
  }
  backend "s3" {
      key = "prod_terraform.tfstate"
      bucket = "sreeterraformbucket"
      region = "us-east-1"
  }
}