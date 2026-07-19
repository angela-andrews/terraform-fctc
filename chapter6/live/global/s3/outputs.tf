# File location: live/global/s3/outputs.tf
# Purpose: Export identifiers for the Terraform state bucket.

output "s3_bucket_name" {
  description = "Name of the S3 bucket that stores Terraform state."
  value       = aws_s3_bucket.fctc_state.bucket
}

output "s3_bucket_arn" {
  description = "ARN of the S3 bucket that stores Terraform state."
  value       = aws_s3_bucket.fctc_state.arn
}

output "s3_bucket_region" {
  description = "AWS Region containing the state bucket."
  value       = var.aws_region
}
