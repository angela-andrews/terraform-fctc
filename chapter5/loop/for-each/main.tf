terraform {
  # Require Terraform 1.x
  required_version = ">= 1.5.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}

# Create one IAM user for each value in the user_names variable.
#
# toset() converts the list into a set:
#   ["lisa", "angela", "pamela"]
#
# becomes
#
#   {
#     "lisa",
#     "angela",
#     "pamela"
#   }
#
# A set guarantees uniqueness and allows Terraform
# to use each username as the resource key.

resource "aws_iam_user" "example" {

  # Create one resource for every item in the set
  for_each = toset(var.user_names)

  # each.value represents the current item
  # in the collection.
  #
  # First iteration:
  #   each.value = "lisa"
  #
  # Second iteration:
  #   each.value = "angela"
  #
  # etc.
  name = each.value

  tags = {
    CreatedBy = "Terraform"
    Example   = "for_each"
  }
}