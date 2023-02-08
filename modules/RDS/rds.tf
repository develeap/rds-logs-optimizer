resource "aws_db_subnet_group" "db_subnet_group" {
  name       = var.db_subnet_group_name
  subnet_ids = data.aws_subnet.subnetworks.*.id

  tags = var.tags
}


resource "aws_db_instance" "db_instance" {
  identifier              = var.db_metadata["identifier"]
  instance_class          = var.db_metadata["instance_class"]
  allocated_storage       = var.db_metadata["allocated_storage"]
  engine                  = var.db_metadata["engine"]
  engine_version          = var.db_metadata["engine_version"]
  username                = var.db_username
  password                = var.db_password
  db_subnet_group_name    = aws_db_subnet_group.db_subnet_group.name
  vpc_security_group_ids  = [data.aws_security_group.security_group.id]
  parameter_group_name    = aws_db_parameter_group.db_params.name
  option_group_name       = aws_db_option_group.db_options.name
  backup_retention_period = var.db_metadata["backup_retention_period"]

  publicly_accessible = var.publicly_accessible_bool
  skip_final_snapshot = var.skip_final_snapshot_bool
  storage_encrypted   = var.storage_encrypted_bool
  multi_az            = var.multi_az_bool

  tags = var.tags
}

resource "aws_db_parameter_group" "db_params" {
  name   = var.db_params["params_group_name"]
  family = var.db_metadata["family"]

  tags = var.tags
}

resource "aws_db_option_group" "db_options" {
  engine_name          = var.db_metadata["engine"]
  major_engine_version = var.db_metadata["major_engine_version"]
  name                 = var.db_params["option_group_name"]

  option {
    option_name = "MARIADB_AUDIT_PLUGIN"

    option_settings {
      name  = "SERVER_AUDIT_FILE_ROTATE_SIZE"
      value = var.db_params["server_audit_file_rotate_size"]
    }

    option_settings {
      name  = "SERVER_AUDIT_FILE_ROTATIONS"
      value = var.db_params["server_audit_file_rotations"]
    }
  }

  tags = var.tags
}