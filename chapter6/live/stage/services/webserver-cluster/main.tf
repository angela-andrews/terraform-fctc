# File location: live/stage/services/webserver-cluster/main.tf
# Purpose: Deploy the stage webserver cluster using the reusable module.

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

data "terraform_remote_state" "mysql" {
  backend = "s3"
  config = {
    bucket = "fctc-state"
    key    = "stage/data-stores/mysql/terraform.tfstate"
    region = "us-east-2"
  }
}

module "webserver_cluster" {
  source = "../../../../modules/services/webserver-cluster"

  cluster_name = "stage-webserver-cluster"
  vpc_id       = data.aws_vpc.default.id
  subnet_ids   = data.aws_subnets.default.ids

  instance_type    = var.instance_type
  server_port      = var.server_port
  alb_port         = var.alb_port
  min_size         = var.min_size
  max_size         = var.max_size
  desired_capacity = var.desired_capacity


  db_address = data.terraform_remote_state.mysql.outputs.address
  db_port    = data.terraform_remote_state.mysql.outputs.port




}