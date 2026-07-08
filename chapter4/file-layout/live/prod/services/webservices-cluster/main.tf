provider "aws" {
  region = "us-east-2"
}   

module "webserver-cluster" {
  source = "../../../../modules/services/webserver-cluster"

  cluster_name = "webservers-stage"
  db_remote_state_bucket = "fctc-state-chapter3"
  db_remote_state_key = "prod/data-stores/mysql/terraform.tfstate"

  instance_type = "t3.micro"
  min_size = 2
  max_size = 4

  custom_tags = {
    "ManagedBy" = "Terraform"
    "Owner"       = "Angela"
  }
}
