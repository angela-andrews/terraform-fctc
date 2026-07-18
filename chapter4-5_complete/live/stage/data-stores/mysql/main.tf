# File location: live/stage/data-stores/mysql/main.tf
# Purpose: Deploy the stage MySQL data store using the reusable module.

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

  name_prefix         = "stage"
  vpc_id              = data.aws_vpc.default.id
  subnet_ids          = data.aws_subnets.default.ids
  allowed_cidr_block  = data.aws_vpc.default.cidr_block

  db_name             = var.db_name
  db_username         = var.db_username
  db_password         = var.db_password
  instance_class      = var.instance_class
  deletion_protection = var.deletion_protection
  skip_final_snapshot = var.skip_final_snapshot
}
