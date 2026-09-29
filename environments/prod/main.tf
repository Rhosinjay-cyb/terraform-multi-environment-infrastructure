terraform {
  required_version = "~> 1.15"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket         = "terraform-state456789"
    key            = "prod/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    use_lockfile  = true
  }
}

provider "aws" {
  region = var.aws_region
}

module "networking" {
  source = "../../modules/networking"

  vpc_cidr             = var.vpc_cidr
  availability_zones   = var.availability_zones
  public_subnet_cidr   = var.public_subnet_cidr
  private_subnet_cidrs = var.private_subnet_cidrs

}

module "compute" {
  source = "../../modules/compute"

  vpc_id        = module.networking.vpc_id
  subnet_id     = module.networking.public_subnet_id
  ami_id        = var.ami_id
  instance_type = var.instance_type
  instance_name = var.instance_name
  key_name      = var.key_name

}

module "database" {
  source = "../../modules/database"

  vpc_id                    = module.networking.vpc_id
  private_subnet_ids        = module.networking.private_subnet_ids
  compute_security_group_id = module.compute.security_group_id

  database_name            = var.database_name
  database_username        = var.database_username
  database_password        = var.database_password
  database_port            = var.database_port
  engine                   = var.engine
  engine_version           = var.engine_version
  instance_class           = var.instance_class
  allocated_storage        = var.allocated_storage
  max_allocated_storage    = var.max_allocated_storage
  storage_type              = var.storage_type
  backup_retention_period  = var.backup_retention_period

}
