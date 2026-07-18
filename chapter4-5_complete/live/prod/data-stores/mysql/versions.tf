# File location: live/prod/data-stores/mysql/versions.tf
# Purpose: Terraform, provider, and backend requirements for prod MySQL.

terraform {
  required_version = ">= 1.10.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket       = "fctc-state-chapter3"
    key          = "prod/data-stores/mysql/terraform.tfstate"
    region       = "us-east-2"
    encrypt      = true
    use_lockfile = true
  }
}
