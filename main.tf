
provider "aws" {
  region = "us-east-2"
}
# This resource block was the cause of the error. Launch Configurations Are Being Phased Out in Favor of Launch Templates. The error message is: "Error: creating AutoScaling Group: ValidationError: 
# You cannot use a launch configuration with an Auto Scaling group. Please use a launch template instead."

resource "aws_launch_template" "example" {
  name_prefix            = "example-"
  image_id               = "ami-0fb653ca2d3203ac1"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.instance.id]

  user_data = base64encode(<<-EOF
              #!/bin/bash
              echo "Hello, FCTC" > index.html
              nohup busybox httpd -f -p ${var.server_port} &
              EOF
  )
  # Required when using a launch template with an auto scaling group.
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group" "instance" {
  name = "terraform-example-instance"

  ingress {
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# removed launch_configuration = aws_launch_configuration.example.name from the autoscaling group 
# and replaced it with launch_template = {

resource "aws_autoscaling_group" "example" {

  vpc_zone_identifier = data.aws_subnets.default.ids

  min_size = 2
  max_size = 10

  launch_template  {
    id      = aws_launch_template.example.id
    version = aws_launch_template.example.latest_version
  }

  tag {
    key                 = "Name"
    value               = "terraform-asg-example"
    propagate_at_launch = true
  }
}

variable "server_port" {
  description = "The port the server will use for http requests"
  type        = number
  default     = 8080
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