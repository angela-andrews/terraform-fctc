####################################################
# List of usernames that Terraform created
####################################################

output "user_names" {

  description = "Names of the IAM users."

  # values() converts the map of resources into a list.
  #
  # aws_iam_user.example looks like:
  #
  # {
  #   "lisa"   = aws_iam_user.example["lisa"]
  #   "angela" = aws_iam_user.example["angela"]
  # }
  #
  # values() returns only the resource objects.
  value = [
    for user in values(aws_iam_user.example) : user.name
  ]
}

####################################################
# IAM User ARNs
####################################################

output "user_arns" {

  description = "ARNs of all IAM users."

  value = [
    for user in values(aws_iam_user.example) : user.arn
  ]
}

####################################################
# Resource Keys
####################################################

output "resource_keys" {

  description = "Keys Terraform uses to track each resource."

  # keys() returns:
  #
  # [
  #   "angela",
  #   "lisa",
  #   "pamela",
  #   "renee"
  # ]
  #
  # Notice these are NOT indexes.
  # They are the actual resource identifiers.
  value = keys(aws_iam_user.example)
}