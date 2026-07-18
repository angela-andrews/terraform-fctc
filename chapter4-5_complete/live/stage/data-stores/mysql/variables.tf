# File location: live/stage/data-stores/mysql/variables.tf
# Purpose: Inputs for the stage MySQL root.

variable "aws_region" {
  description = "AWS Region."
  type        = string
  default     = "us-east-2"
}
variable "db_name" {
  description = "Initial database name."
  type        = string
  default     = "stage_example_database"
}
variable "db_username" {
  description = "Master username."
  type        = string
  default     = "admin"
}
variable "db_password" {
  description = "Master password."
  type        = string
  sensitive   = true
}
variable "instance_class" {
  description = "RDS instance class."
  type        = string
  default     = "db.t4g.micro"
}
variable "deletion_protection" {
  description = "Enable deletion protection."
  type        = bool
  default     = false
}
variable "skip_final_snapshot" {
  description = "Skip final snapshot on destroy."
  type        = bool
  default     = true
}
variable "common_tags" {
  description = "Common tags."
  type        = map(string)
  default = {
    Project     = "From Cover to Code"
    ManagedBy   = "Terraform"
    Environment = "stage"
  }
}
