# File location: live/global/s3/variables.tf
# Purpose: Inputs for the Terraform remote-state bucket.

variable "aws_region" {
  description = "AWS Region where the state bucket is created."
  type        = string
  default     = "us-east-2"
}

variable "bucket_name" {
  description = "Globally unique S3 bucket name used for Terraform state."
  type        = string
  default     = "fctc-state"

  validation {
    condition     = length(var.bucket_name) >= 3 && length(var.bucket_name) <= 63
    error_message = "The bucket name must contain between 3 and 63 characters."
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
