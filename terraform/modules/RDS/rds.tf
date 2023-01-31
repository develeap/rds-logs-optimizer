resource "aws_db_subnet_group" "ninja_db_subnet_group" {
  name       = var.db_subnet_group_name
  subnet_ids = data.aws_subnet.ninja_subnet.*.id

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
  parameter_group_name   = aws_db_parameter_group.ninja_db_instance_parameters.name
  publicly_accessible    = var.db_instance_publicly_accessible_bool
  skip_final_snapshot    = var.db_instance_skip_final_snapshot_bool

  tags = var.tags
}

resource "aws_db_parameter_group" "ninja_db_instance_parameters" {
  name   = var.db_instance_parameter_group["name"]
  family = var.db_instance_parameter_group["family"]

  parameter {
    name  = var.db_instance_parameters_map["name"]
    value = var.db_instance_parameters_map["value"]
  }

  tags = var.tags
}