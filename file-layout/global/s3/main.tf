terraform {
  required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket         = "fctc-state-chapter3"
    key            = "global/s3/terraform.tfstate"
    region         = "us-east-2"

    # Optional but highly recommended
    encrypt        = true

    # For state locking
    use_lockfile   = true
  }
}

provider "aws" {
  region = "us-east-2"
} 

resource "aws_s3_bucket" "fctc_state" {
  bucket = "fctc-state-chapter3"

 # Prevent accidental deletion of the state bucket
 lifecycle {
    prevent_destroy = true
  }
}
 
# Enable versioning so you can see the full revision history of the state file your 
# state files

resource "aws_s3_bucket_versioning" "enabled" {
  bucket = aws_s3_bucket.fctc_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Enable server-side encryption by default
resource "aws_s3_bucket_server_side_encryption_configuration" "default" {
  bucket = aws_s3_bucket.fctc_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# Explicitly block all public access to the bucket
resource "aws_s3_bucket_public_access_block" "block_public_access" {
  bucket = aws_s3_bucket.fctc_state.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

}

