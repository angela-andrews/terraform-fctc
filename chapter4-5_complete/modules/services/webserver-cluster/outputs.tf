# File location: modules/services/webserver-cluster/outputs.tf
# Purpose: Values exposed by the reusable webserver-cluster module.

output "alb_dns_name" {
  description = "ALB DNS name."
  value       = aws_lb.this.dns_name
}
output "alb_url" {
  description = "ALB HTTP URL."
  value       = "http://${aws_lb.this.dns_name}"
}
output "autoscaling_group_name" {
  description = "ASG name."
  value       = aws_autoscaling_group.this.name
}
output "instance_security_group_id" {
  description = "EC2 security group ID."
  value       = aws_security_group.instance.id
}
