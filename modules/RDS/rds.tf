resource "aws_db_subnet_group" "ninja_db_subnet_group" {
  name       = var.db_subnet_group_name
  subnet_ids = data.aws_subnet.ninja_subnets.*.id

  tags = var.tags
}


resource "aws_db_instance" "ninja_db_instance" {
  identifier             = var.db_instance_metadata["identifier"]
  instance_class         = var.db_instance_metadata["instance_class"]
  allocated_storage      = var.db_instance_metadata["allocated_storage"]
  engine                 = var.db_instance_metadata["engine"]
  engine_version         = var.db_instance_metadata["engine_version"]
  username               = var.db_instance_username
  password               = var.db_instance_password
  db_subnet_group_name   = aws_db_subnet_group.ninja_db_subnet_group.name
  vpc_security_group_ids = [data.aws_security_group.ninja_sg.id]
  parameter_group_name   = aws_db_parameter_group.ninja_db_instance_params.name
  option_group_name      = aws_db_option_group.ninja_db_instance_options.name
  publicly_accessible    = var.db_instance_metadata["publicly_accessible"]
  skip_final_snapshot    = var.db_instance_metadata["skip_final_snapshot"]
  storage_encrypted      = var.db_instance_metadata["storage_encrypted"]
  multi_az               = var.db_instance_metadata["multi_az"]

  tags = var.tags
}

resource "aws_db_parameter_group" "ninja_db_instance_params" {
  name   = var.db_instance_params["params_group_name"]
  family = var.db_instance_metadata["family"]

  tags = var.tags
}

resource "aws_db_option_group" "ninja_db_instance_options" {
  engine_name          = var.db_instance_metadata["engine"]
  major_engine_version = var.db_instance_metadata["major_engine_version"]
  name                 = var.db_instance_params["option_group_name"]

  option {
    option_name = "MARIADB_AUDIT_PLUGIN"

    option_settings {
      name  = var.db_instance_params["name_server_audit_file_rotate_size"]
      value = var.db_instance_params["value_server_audit_file_rotate_size"]
    }

    option_settings {
      name  = var.db_instance_params["name_server_audit_file_rotations"]
      value = var.db_instance_params["value_server_audit_file_rotations"]
    }
  }

  tags = var.tags
}