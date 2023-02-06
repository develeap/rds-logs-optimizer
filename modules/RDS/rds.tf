resource "aws_db_subnet_group" "rds_optimizer_db_subnet_group" {
  name       = var.rds_logs_db_subnet_group_name
  subnet_ids = data.aws_subnet.rds_optimizer_subnetworks.*.id

  tags = var.rds_logs_tags
}


resource "aws_db_instance" "rds_optimizer_db_instance" {
  identifier             = var.rds_logs_db_instance_metadata["identifier"]
  instance_class         = var.rds_logs_db_instance_metadata["instance_class"]
  allocated_storage      = var.rds_logs_db_instance_metadata["allocated_storage"]
  engine                 = var.rds_logs_db_instance_metadata["engine"]
  engine_version         = var.rds_logs_db_instance_metadata["engine_version"]
  username               = var.rds_logs_db_instance_username
  password               = var.rds_logs_db_instance_password
  db_subnet_group_name   = aws_db_subnet_group.rds_optimizer_db_subnet_group.name
  vpc_security_group_ids = [data.aws_security_group.rds_optimizer_security_group.id]
  parameter_group_name   = aws_db_parameter_group.rds_optimizer_db_instance_params.name
  option_group_name      = aws_db_option_group.rds_optimizer_db_instance_options.name
  publicly_accessible    = var.publicly_accessible_bool
  skip_final_snapshot    = var.skip_final_snapshot_bool
  storage_encrypted      = var.storage_encrypted_bool
  multi_az               = var.multi_az_bool

  tags = var.rds_logs_tags
}

resource "aws_db_parameter_group" "rds_optimizer_db_instance_params" {
  name   = var.rds_logs_db_instance_params["params_group_name"]
  family = var.rds_logs_db_instance_metadata["family"]

  tags = var.rds_logs_tags
}

resource "aws_db_option_group" "rds_optimizer_db_instance_options" {
  engine_name          = var.rds_logs_db_instance_metadata["engine"]
  major_engine_version = var.rds_logs_db_instance_metadata["major_engine_version"]
  name                 = var.rds_logs_db_instance_params["option_group_name"]

  option {
    option_name = "MARIADB_AUDIT_PLUGIN"

    option_settings {
      name  = "SERVER_AUDIT_FILE_ROTATE_SIZE"
      value = var.rds_logs_db_instance_params["server_audit_file_rotate_size"]
    }

    option_settings {
      name  = "SERVER_AUDIT_FILE_ROTATIONS"
      value = var.rds_logs_db_instance_params["server_audit_file_rotations"]
    }
  }

  tags = var.rds_logs_tags
}