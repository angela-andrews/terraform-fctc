# File location: modules/services/webserver-cluster/variables.tf
# Purpose: Input contract for the reusable webserver-cluster module.

variable "cluster_name" {
  description = "Name for cluster resources."
  type        = string
}
variable "vpc_id" {
  description = "VPC ID."
  type        = string
}
variable "subnet_ids" {
  description = "Subnet IDs for ALB and ASG."
  type        = list(string)
}


variable "alb_port" {
  description = "ALB listener port."
  type        = number
  default     = 80
}
variable "allowed_cidr_blocks" {
  description = "CIDRs allowed to reach ALB."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "desired_capacity" {
  description = "Desired ASG size."
  type        = number
}
variable "db_address" {
  description = "Database endpoint inserted into page."
  type        = string
}
variable "db_port" {
  description = "Database port inserted into page."
  type        = number
}
