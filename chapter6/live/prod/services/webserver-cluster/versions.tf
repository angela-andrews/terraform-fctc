# File location: live/prod/services/webserver-cluster/versions.tf
# Purpose: Terraform, provider, and backend requirements for the prod web cluster.

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
    key          = "prod/services/webserver-cluster/terraform.tfstate"
    region       = "us-east-2"
    encrypt      = true
    use_lockfile = true
  }
}
