
# File location: modules/data-stores/mysql/variables.tf
# Purpose: Input contract for the reusable MySQL module.

variable "name_prefix" {
  description = "Prefix for database resource names."
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for database networking."
  type        = string
}

variable "subnet_ids" {
  description = "Subnet IDs for the DB subnet group."
  type        = list(string)
}

variable "allowed_cidr_block" {
  description = "CIDR allowed to connect to MySQL."
  type        = string
}

variable "db_name" {
  description = "Initial database name."
  type        = string
  default     = "example_database"
}

variable "db_credentials_secret_id" {
  description = "Name of the AWS Secrets Manager secret containing the database username and password."
  type        = string

  validation {
    condition     = length(trimspace(var.db_credentials_secret_id)) > 0
    error_message = "db_credentials_secret_id must be a non-empty Secrets Manager secret name or ARN."
  }
}

variable "db_port" {
  description = "MySQL port."
  type        = number
  default     = 3306
}

variable "engine_version" {
  description = "MySQL major version."
  type        = string
  default     = "8.0"
}

variable "instance_class" {
  description = "RDS instance class."
  type        = string
  default     = "db.t4g.micro"
}

variable "allocated_storage" {
  description = "Initial storage in GiB."
  type        = number
  default     = 20
}

variable "max_allocated_storage" {
  description = "Maximum autoscaled storage in GiB."
  type        = number
  default     = 100
}

variable "backup_retention_period" {
  description = "Backup retention in days."
  type        = number
  default     = 1
}

variable "deletion_protection" {
  description = "Enable deletion protection."
  type        = bool
  default     = false
}

variable "skip_final_snapshot" {
  description = "Skip final snapshot at destroy."
  type        = bool
  default     = true
}

