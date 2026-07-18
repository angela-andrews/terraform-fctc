# File location: live/global/iam/outputs.tf
# Purpose: Export IAM usernames and ARNs.

output "user_names" {
  description = "IAM usernames and for_each resource keys."
  value       = sort(keys(aws_iam_user.example))
}

output "user_arns" {
  description = "Map of IAM username to ARN."
  value       = { for name, user in aws_iam_user.example : name => user.arn }
}
