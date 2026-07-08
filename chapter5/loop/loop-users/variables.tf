variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-2"
}

variable "user_name" {
  description = "Create IAM users with the specified names"

  type = list(string)

  default = [
    "lisa",
    "angela",
    "pamela",
    "renee"
  ]
}