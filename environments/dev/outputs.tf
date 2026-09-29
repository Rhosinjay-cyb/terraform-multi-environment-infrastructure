output "vpc_id" {
  description = "ID of the dev VPC"
  value       = module.networking.vpc_id
}

output "public_subnet_id" {
  description = "ID of the dev public subnet"
  value       = module.networking.public_subnet_id
}

output "private_subnet_ids" {
  description = "IDs of the dev private subnets"
  value       = module.networking.private_subnet_ids
}

output "ec2_instance_id" {
  description = "ID of the dev EC2 instance"
  value       = module.compute.instance_id
}

output "ec2_private_ip" {
  description = "Private IP address of the dev EC2 instance"
  value       = module.compute.instance_private_ip
}

output "ec2_public_ip" {
  description = "Public IP address of the dev EC2 instance"
  value       = module.compute.instance_public_ip
}

output "compute_security_group_id" {
  description = "ID of the dev compute security group"
  value       = module.compute.security_group_id
}

output "database_id" {
  description = "ID of the dev RDS database"
  value       = module.database.database_id
}

output "database_endpoint" {
  description = "Endpoint of the dev RDS database"
  value       = module.database.database_endpoint
}

output "database_port" {
  description = "Port of the dev RDS database"
  value       = module.database.database_port
}

output "database_security_group_id" {
  description = "ID of the dev database security group"
  value       = module.database.security_group_id
}
