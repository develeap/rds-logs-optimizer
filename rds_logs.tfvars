# Example .tfvars file with correct set of variables
# for the terraform module to run properly.

# NOTE: Some of these must be changed before planned 'terraform apply' action

aws_region                  = "eu-north-1"
rds_logs_cidr_blocks        = ["10.10.0.0/24", "10.10.1.0/24", "10.10.2.0/24"]
rds_logs_availability_zones = ["eu-north-1a", "eu-north-1b", "eu-north-1c"]
rds_logs_tags = {
  created_by = "Adam Stegienko"
  project    = "RDS Audit Cost"
  team       = "Ninja"
}
rds_logs_subnet_count = 3
rds_logs_security_group = {
  name        = "rds_optimizer_security_group"
  description = "Security Group for RDS Optimizer"
}
rds_logs_ingress_rule_one = {
  description = "Inbound connection"
  from_port   = 22
  to_port     = 22
  protocol    = "TCP"
}
rds_logs_ingress_rule_two = {
  description = "Inbound connection"
  from_port   = 5432
  to_port     = 5432
  protocol    = "TCP"
}
rds_logs_egress_rule = {
  description      = "Outbound connection"
  from_port        = 0
  to_port          = 0
  protocol         = "-1"
  cidr_blocks      = "0.0.0.0/0"
  ipv6_cidr_blocks = "::/0"
}
rds_logs_vpc_ip_range         = "10.10.0.0/16"
rds_logs_route_table_ip_range = "0.0.0.0/0"
rds_logs_db_subnet_group_name = "rds-logs-db-subnet-group"
rds_logs_db_instance_metadata = {
  identifier           = "rds-logs-db-instance"
  instance_class       = "db.t3.micro"
  allocated_storage    = 10
  engine               = "mariadb"
  engine_version       = "10.6.11"
  major_engine_version = "10.6"
  family               = "mariadb10.6"
}
rds_logs_db_instance_username = "adam"
rds_logs_db_instance_password = "strong-password"
rds_logs_db_instance_params = {
  option_group_name             = "rds-logs-db-opt-params"
  params_group_name             = "rds-logs-db-params"
  log_connections               = "1"
  server_audit_file_rotate_size = "10"
  server_audit_file_rotations   = "10"
}
rds_logs_s3_metadata = {
  bucket = "rds-logs-bucket"
  acl    = "private"
}