# File location: modules/data-stores/mysql/outputs.tf
# Purpose: Values exposed by the reusable MySQL module.

output "address" {
  description = "RDS endpoint hostname."
  value       = aws_db_instance.this.address
}
output "port" {
  description = "RDS listener port."
  value       = aws_db_instance.this.port
}
output "database_name" {
  description = "Initial database name."
  value       = aws_db_instance.this.db_name
}
output "database_security_group_id" {
  description = "RDS security group ID."
  value       = aws_security_group.database.id
}

output "db_credentials_secret_id" {
  description = "Name of the Secrets Manager secret used for the database credentials."
  value       = var.db_credentials_secret_id
}