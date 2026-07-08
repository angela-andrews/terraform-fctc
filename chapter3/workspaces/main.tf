terraform {
  required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket         = "fctc-state-chapter3"
    key            = "workspaces-example/terraform.tfstate"
    region         = "us-east-2"

    # Optional but highly recommended
    encrypt        = true

    # For state locking
    use_lockfile   = true
  }
}

provider "aws" {
  region = "us-east-2"
} 

resource "aws_instance" "example" {
  ami           = "ami-0772d6acfbccb1275"
  instance_type = "t2.micro"
}