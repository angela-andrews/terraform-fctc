# Alwasy use required_providers block to specify the provider 
# source and version. This ensures that Terraform uses the correct 
# provider and avoids issues with provider versioning.


terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Multiple provider blocks for multiple regions

provider "aws" {
  region = "us-east-2"
  alias  = "region_1"
}

provider "aws" {
  region = "us-west-2"
  alias  = "region_2"
}

data "aws_region" "region_1" {
  provider = aws.region_1
}

data "aws_region" "region_2" {
  provider = aws.region_2
}

data "aws_ami" "region_1" {
  provider    = aws.region_1
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

data "aws_ami" "region_2" {
  provider    = aws.region_2
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}




resource "aws_instance" "region_1" {
  provider = aws.region_1

  # Note the different AMI ID
  ami           = data.aws_ami.region_1.id
  instance_type = var.instance_class

  tags = merge(
    var.instance_tags,
    {
      Name = "${var.instance_tags["Name"]}_region_1"
    }
  )
}

resource "aws_instance" "region_2" {
  provider = aws.region_2

  # Note the different us-west-2AMI ID
  ami           = data.aws_ami.region_2.id
  instance_type = var.instance_class

  tags = merge(
    var.instance_tags,
    {
      Name = "${var.instance_tags["Name"]}_region_2"
    }
  )
}