# File location: live/global/iam/variables.tf
# Purpose: Inputs for the global IAM root module.

variable "aws_region" {
  description = "AWS provider Region. IAM itself is global."
  type        = string
  default     = "us-east-2"
}

variable "user_names" {
  description = "Unique IAM usernames Terraform creates."
  type        = list(string)
  default     = ["lisa", "angela", "pamela", "renee"]

  validation {
    condition     = length(var.user_names) == length(toset(var.user_names))
    error_message = "Every username must be unique."
  }
}

variable "common_tags" {
  description = "Tags applied automatically to supported resources."
  type        = map(string)
  default = {
    Project   = "From Cover to Code"
    ManagedBy = "Terraform"
    Scope     = "Global"
  }
}
