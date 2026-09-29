variable "vpc_id" {
  description = "ID of the VPC where the compute resources will be deployed"
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet where the EC2 instance will be deployed"
  type        = string
}

variable "ami_id" {
  description = "AMI ID to use for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "instance_name" {
  description = "Name tag for the EC2 instance"
  type        = string
}

variable "key_name" {
  description = "Name of the EC2 key pair used for instance access"
  type        = string
}

