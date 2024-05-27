#This Terraform Code Deploys Basic VPC Infra.
provider "aws" {
    region = var.aws_region
    profile = var.profile
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
      key = "dev_terraform.tfstate"
      bucket = "sreeterraformbucket"
      region = "us-east-1"
  }
}