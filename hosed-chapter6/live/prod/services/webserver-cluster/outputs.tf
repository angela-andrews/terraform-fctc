# File location: live/prod/services/webserver-cluster/outputs.tf
# Purpose: Export values from the prod webserver cluster.

output "alb_dns_name" {
  description = "ALB DNS name."
  value       = module.webserver_cluster.alb_dns_name
}
output "alb_url" {
  description = "ALB HTTP URL."
  value       = module.webserver_cluster.alb_url
}
output "autoscaling_group_name" {
  description = "ASG name."
  value       = module.webserver_cluster.autoscaling_group_name
}
output "instance_security_group_id" {
  description = "EC2 security group ID."
  value       = module.webserver_cluster.instance_security_group_id
}
