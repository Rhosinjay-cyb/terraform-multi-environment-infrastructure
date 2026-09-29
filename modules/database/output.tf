output "database_id" {
  description = "ID of the RDS database instance"
  value       = aws_db_instance.database.id
}

output "database_arn" {
  description = "ARN of the RDS database instance"
  value       = aws_db_instance.database.arn
}

output "database_endpoint" {
  description = "Connection endpoint of the RDS database"
  value       = aws_db_instance.database.endpoint
}

output "database_port" {
  description = "Port on which the RDS database accepts connections"
  value       = aws_db_instance.database.port
}

output "security_group_id" {
  description = "ID of the database security group"
  value       = aws_security_group.database.id
}

output "subnet_group_name" {
  description = "Name of the RDS database subnet group"
  value       = aws_db_subnet_group.database.name
}
