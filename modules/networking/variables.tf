variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string

  validation {
    condition     = can(cidrhost(var.vpc_cidr, 0))
    error_message = "vpc_cidr must be a valid IPv4 CIDR block."
  }
}

variable "availability_zones" {
  description = "Availability Zones for the subnets"
  type        = list(string)

  validation {
    condition     = length(var.availability_zones) >= 2
    error_message = "At least two Availability Zones must be provided."
  }
}


variable "public_subnet_cidr" {
  description = "CIDR blocks for the public subnets"
  type        = string

  validation {
    condition     = length(var.public_subnet_cidr) > 0
    error_message = "At least one public subnet CIDR must be provided."
  }
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for the private subnets"
  type        = list(string)

  validation {
    condition     = length(var.private_subnet_cidrs) >= 2
    error_message = "At least two private subnet CIDRs must be provided."
  }
}
