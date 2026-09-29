output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.compute.id
}

output "instance_private_ip" {
  description = "Private IP address of the EC2 instance"
  value       = aws_instance.compute.private_ip
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.compute.public_ip
}

output "security_group_id" {
  description = "ID of the compute security group"
  value       = aws_security_group.compute.id
}
