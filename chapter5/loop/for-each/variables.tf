# AWS Region
variable "aws_region" {
  description = "AWS Region where resources will be created."

  type = string

  default = "us-east-1"
}

# List of IAM users to create
variable "user_names" {

  description = "A list of IAM usernames."

  type = list(string)

  default = [
    "lisa",
    "angela",
    "pamela",
    "renee"
  ]
}