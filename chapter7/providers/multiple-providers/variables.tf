variable "instance_class" {
  description = "EC2 instance class."
  type        = string
  default     = "t2.micro"
}

variable "instance_tags" {
  description = "Tags to apply to the EC2 instance."
  type        = map(string)
  default = {
    Name      = "example-instance"
    User      = "Angela"
    Project   = "From Cover to Code"
    ManagedBy = "Terraform"
    chapter   = "7"
  }
}