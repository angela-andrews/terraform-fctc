# File location: live/prod/services/webserver-cluster/variables.tf
# Purpose: Inputs for the prod webserver cluster.

variable "aws_region" {
  description = "AWS Region."
  type        = string
  default     = "us-east-2"
}
variable "instance_type" {
  description = "EC2 instance type."
  type        = string
  default     = "t3.micro"
}
variable "server_port" {
  description = "Instance webserver port."
  type        = number
  default     = 8080
}
variable "alb_port" {
  description = "ALB listener port."
  type        = number
  default     = 80
}
variable "min_size" {
  description = "Minimum ASG size."
  type        = number
  default     = 2
}
variable "max_size" {
  description = "Maximum ASG size."
  type        = number
  default     = 4
}
variable "desired_capacity" {
  description = "Desired ASG size."
  type        = number
  default     = 2
}
variable "common_tags" {
  description = "Common tags."
  type        = map(string)
  default = {
    Project     = "From Cover to Code"
    ManagedBy   = "Terraform"
    Environment = "prod"
  }
}
