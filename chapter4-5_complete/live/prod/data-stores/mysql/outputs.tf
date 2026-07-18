# File location: live/prod/data-stores/mysql/outputs.tf
# Purpose: Export database values consumed by the prod web cluster.

output "address" {
  description = "RDS endpoint hostname."
  value       = module.mysql.address
}
output "port" {
  description = "RDS listener port."
  value       = module.mysql.port
}
output "database_name" {
  description = "Initial database name."
  value       = module.mysql.database_name
}
output "database_security_group_id" {
  description = "RDS security group ID."
  value       = module.mysql.database_security_group_id
}
