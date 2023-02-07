module "Network" {
  source = "./modules/Network"

  my_ip_address                 = data.external.my_ip_address.result.ip
  rds_logs_tags                 = var.rds_logs_tags
  rds_logs_subnet_count         = var.rds_logs_subnet_count
  rds_logs_cidr_blocks          = var.rds_logs_cidr_blocks
  rds_logs_availability_zones   = var.rds_logs_availability_zones
  rds_logs_ingress_rule_one     = var.rds_logs_ingress_rule_one
  rds_logs_ingress_rule_two     = var.rds_logs_ingress_rule_two
  rds_logs_egress_rule          = var.rds_logs_egress_rule
  rds_logs_vpc_ip_range         = var.rds_logs_vpc_ip_range
  enable_dns_support_bool       = var.enable_dns_support_bool
  enable_dns_hostnames_bool     = var.enable_dns_hostnames_bool
  rds_logs_route_table_ip_range = var.rds_logs_route_table_ip_range
  rds_logs_security_group       = var.rds_logs_security_group
}

module "RDS" {
  source     = "./modules/RDS"
  depends_on = [module.Network]

  rds_optimizer_subnetworks     = module.Network.rds_optimizer_subnetworks
  rds_optimizer_security_group  = module.Network.rds_optimizer_security_group
  rds_logs_tags                 = var.rds_logs_tags
  rds_logs_subnet_count         = var.rds_logs_subnet_count
  rds_logs_db_subnet_group_name = var.rds_logs_db_subnet_group_name
  rds_logs_db_instance_metadata = var.rds_logs_db_instance_metadata
  rds_logs_db_instance_username = var.rds_logs_db_instance_username
  rds_logs_db_instance_password = var.rds_logs_db_instance_password
  rds_logs_db_instance_params   = var.rds_logs_db_instance_params
}

module "S3" {
  source     = "./modules/S3"
  depends_on = [module.RDS]

  rds_logs_tags        = var.rds_logs_tags
  rds_logs_s3_metadata = var.rds_logs_s3_metadata
}

module "Lambda" {
  source     = "./modules/Lambda"
  depends_on = [module.S3]

  rds_logs_s3_bucket            = module.S3.rds_logs_s3_bucket
  rds_logs_tags                 = var.rds_logs_tags
  rds_logs_db_instance_metadata = var.rds_logs_db_instance_metadata
}