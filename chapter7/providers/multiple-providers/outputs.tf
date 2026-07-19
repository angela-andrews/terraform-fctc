output "region_1" {
  description = "The name of the first region."
  value       = data.aws_region.region_1.region
}
output "region_2" {
  description = "The name of the second region."
  value       = data.aws_region.region_2.region
}

output "ami_id_region_1" {
  description = "The AMI ID for the first region."
  value       = data.aws_ami.region_1.id
}
output "ami_id_region_2" {
  description = "The AMI ID for the second region."
  value       = data.aws_ami.region_2.id
}
output "instance_id_region_1" {
  description = "The instance ID for the first region."
  value       = aws_instance.region_1.id
}
output "instance_id_region_2" {
  description = "The instance ID for the second region."
  value       = aws_instance.region_2.id
}

output "instance_region_1_az" {
  description = "The availability zone for the first region."
  value       = aws_instance.region_1.availability_zone
}

output "instance_region_2_az" {
  description = "The availability zone for the second region."
  value       = aws_instance.region_2.availability_zone
}