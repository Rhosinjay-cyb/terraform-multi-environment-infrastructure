variable "aws_region" {
  description = "AWS region where the dev environment will be deployed"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the dev VPC"
  type        = string
}

variable "availability_zones" {
  description = "Availability Zones for the dev environment"
  type        = list(string)

  validation {
    condition     = length(var.availability_zones) >= 2
    error_message = "At least two Availability Zones must be provided."
  }
}

variable "public_subnet_cidr" {
  description = "CIDR block for the dev public subnet"
  type        = string
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for the dev private subnets"
  type        = list(string)

  validation {
    condition     = length(var.private_subnet_cidrs) >= 2
    error_message = "At least two private subnet CIDRs must be provided."
  }
}

variable "ami_id" {
  description = "AMI ID for the dev EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type for the dev environment"
  type        = string
}

variable "instance_name" {
  description = "Name of the dev EC2 instance"
  type        = string
}

variable "key_name" {
  description = "AWS key pair name for the dev EC2 instance"
  type        = string
}

variable "database_name" {
  description = "Name of the dev RDS database"
  type        = string
}

variable "database_username" {
  description = "Master username for the dev RDS database"
  type        = string
}

variable "database_password" {
  description = "Master password for the dev RDS database"
  type        = string
  sensitive   = true
}

variable "database_port" {
  description = "Port for the dev RDS database"
  type        = number

  validation {
    condition     = var.database_port > 0 && var.database_port <= 65535
    error_message = "database_port must be between 1 and 65535."
  }
}

variable "engine" {
  description = "Database engine for the dev RDS instance"
  type        = string
}

variable "engine_version" {
  description = "Database engine version for the dev RDS instance"
  type        = string
}

variable "instance_class" {
  description = "RDS instance class for the dev environment"
  type        = string
}

variable "allocated_storage" {
  description = "Initial storage allocated to the dev RDS instance in GB"
  type        = number

  validation {
    condition     = var.allocated_storage > 0
    error_message = "allocated_storage must be greater than zero."
  }
}

variable "max_allocated_storage" {
  description = "Maximum storage the dev RDS instance can automatically scale to in GB"
  type        = number
}

variable "storage_type" {
  description = "Storage type for the dev RDS instance"
  type        = string
}

variable "backup_retention_period" {
  description = "Number of days to retain automated backups for the dev RDS instance"
  type        = number

  validation {
    condition     = var.backup_retention_period >= 0 && var.backup_retention_period <= 35
    error_message = "backup_retention_period must be between 0 and 35 days."
  }
}
