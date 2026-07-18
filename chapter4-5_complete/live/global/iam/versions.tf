# File location: live/global/iam/versions.tf
# Purpose: Terraform, AWS provider, and backend requirements for global IAM.

terraform {
  required_version = ">= 1.10.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket       = "fctc-state"
    key          = "global/iam/terraform.tfstate"
    region       = "us-east-2"
    encrypt      = true
    use_lockfile = true
  }
}
