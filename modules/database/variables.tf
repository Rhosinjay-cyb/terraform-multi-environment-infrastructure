variable "vpc_id" {
  description = "ID of the VPC where the database will be deployed"
  type        = string
}

variable "private_subnet_ids" {
  description = "IDs of the private subnets for the RDS database subnet group"
  type        = list(string)

  validation {
    condition     = length(var.private_subnet_ids) >= 2
    error_message = "At least two private subnet IDs must be provided for the RDS database subnet group."
  }
}

variable "compute_security_group_id" {
  description = "ID of the compute security group allowed to access the database"
  type        = string
}

variable "database_name" {
  description = "Name of the RDS database"
  type        = string
}

variable "database_username" {
  description = "Master username for the RDS database"
  type        = string
}

variable "database_password" {
  description = "Master password for the RDS database"
  type        = string
  sensitive   = true
}

variable "database_port" {
  description = "Port on which the database accepts connections"
  type        = number
  default     = 3306

  validation {
    condition     = var.database_port > 0 && var.database_port <= 65535
    error_message = "database_port must be between 1 and 65535."
  }
}

variable "engine" {
  description = "Database engine for the RDS instance"
  type        = string
  default     = "mysql"
}

variable "engine_version" {
  description = "Version of the database engine"
  type        = string
}

variable "instance_class" {
  description = "RDS instance class"
  type        = string
}

variable "allocated_storage" {
  description = "Initial amount of storage allocated to the RDS instance in GB"
  type        = number

  validation {
    condition     = var.allocated_storage > 0
    error_message = "allocated_storage must be greater than zero."
  }
}

variable "max_allocated_storage" {
  description = "Maximum storage size that RDS can automatically scale to in GB"
  type        = number
  default     = 0
}

variable "storage_type" {
  description = "Storage type for the RDS instance"
  type        = string
  default     = "gp3"
}

variable "backup_retention_period" {
  description = "Number of days to retain automated backups"
  type        = number
  default     = 7

  validation {
    condition     = var.backup_retention_period >= 0 && var.backup_retention_period <= 35
    error_message = "backup_retention_period must be between 0 and 35 days."
  }
}

