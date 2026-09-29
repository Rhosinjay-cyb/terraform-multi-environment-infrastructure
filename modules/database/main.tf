resource "aws_db_subnet_group" "database" {
  name       = "${var.database_name}-subnet-group"
  subnet_ids = var.private_subnet_ids

 }

resource "aws_security_group" "database" {
  name        = "${var.database_name}-sg"
  description = "Security group for ${var.database_name}"
  vpc_id      = var.vpc_id

  ingress {
    description     = "Allow database traffic from compute resources"
    from_port       = var.database_port
    to_port         = var.database_port
    protocol        = "tcp"
    security_groups = [var.compute_security_group_id]
  }

  egress {
    description = "Allow outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

 }

resource "aws_db_instance" "database" {
  identifier = var.database_name

  engine         = var.engine
  engine_version = var.engine_version

  instance_class        = var.instance_class
  allocated_storage     = var.allocated_storage
  max_allocated_storage = var.max_allocated_storage
  storage_type          = var.storage_type

  db_name  = var.database_name
  username = var.database_username
  password = var.database_password
  port     = var.database_port

  db_subnet_group_name   = aws_db_subnet_group.database.name
  vpc_security_group_ids = [aws_security_group.database.id]

  publicly_accessible = false

  backup_retention_period = var.backup_retention_period
  skip_final_snapshot     = true

 }
