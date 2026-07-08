output "user_arns" {
  description = "ARNs of all IAM users"

  value = aws_iam_user.example[*].arn
}

output "user_names" {
  description = "Names of all IAM users"

  value = aws_iam_user.example[*].name
}

# all_users is a map of all the IAM users that Terraform created.
output "all_users" {

  value = aws_iam_user.example 
}

# having a map rather than an array is useful because you can look up a specific user by name.
# or remove a specific user from the map by name.