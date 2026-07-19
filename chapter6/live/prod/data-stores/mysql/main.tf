# File location: live/prod/data-stores/mysql/main.tf
# Purpose: Deploy the prod MySQL data store using the reusable module.

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = var.common_tags
  }
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

module "mysql" {
  source = "../../../../modules/data-stores/mysql"

  name_prefix        = "prod"
  vpc_id             = data.aws_vpc.default.id
  subnet_ids         = data.aws_subnets.default.ids
  allowed_cidr_block = data.aws_vpc.default.cidr_block

  db_name = var.db_name

  # The reusable module retrieves the database username and password
  # from this AWS Secrets Manager secret.
  db_credentials_secret_id = "prod/db-creds"

  instance_class      = var.instance_class
  deletion_protection = var.deletion_protection
  skip_final_snapshot = var.skip_final_snapshot
}

