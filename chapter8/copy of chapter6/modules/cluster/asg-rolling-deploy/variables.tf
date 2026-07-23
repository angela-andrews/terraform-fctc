variable "cluster_name" {
  description = "Name for cluster resources."
  type        = string
}

# missing ami variable copied from repo code

variable "ami" {
  description = "The AMI to run in the cluster"
  type        = string
}


variable "instance_type" {
  description = "EC2 instance type."
  type        = string
  default     = "t3.micro"
}

variable "min_size" {
  description = "Minimum ASG size."
  type        = number
}
variable "max_size" {
  description = "Maximum ASG size."
  type        = number
}

# enable_autoscaling variable copied from repo code

variable "enable_autoscaling" {
  description = "If set to true, enable auto scaling"
  type        = bool
}


variable "server_port" {
  description = "Instance webserver port."
  type        = number
  default     = 8080
}


# custom_tags variable copied from repo code

variable "custom_tags" {
  description = "Custom tags to set on the Instances in the ASG"
  type        = map(string)
  default     = {}
}