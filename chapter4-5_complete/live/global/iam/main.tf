# File location: live/global/iam/main.tf
# Purpose: Create one IAM user for each unique value in user_names.

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = var.common_tags
  }
}

resource "aws_iam_user" "example" {
  # Convert the list into a set so every name becomes a stable resource key.
  for_each = toset(var.user_names)

  # For a set of strings, each.key and each.value contain the same string.
  name = each.value
}
