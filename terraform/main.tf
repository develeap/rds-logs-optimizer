module "Network" {
  source = "./modules/Network"

  tags                      = var.tags
  no_of_subnets             = var.no_of_subnets
  cidr_block                = var.cidr_block
  availability_zone         = var.availability_zone
  ingress_one               = var.ingress_one
  ingress_two               = var.ingress_two
  egress_all                = var.egress_all
  vpc_ip_range              = var.vpc_ip_range
  enable_dns_support_bool   = var.enable_dns_support_bool
  enable_dns_hostnames_bool = var.enable_dns_hostnames_bool
  route_table_ip_range      = var.route_table_ip_range
  security_group            = var.security_group
}

module "RDS" {
  source     = "./modules/RDS"
  depends_on = [module.Network]

  ninja_vpc                            = module.Network.ninja_vpc
  ninja_subnets                        = module.Network.ninja_subnets
  ninja_internet_gateway               = module.Network.ninja_internet_gateway
  ninja_security_group                 = module.Network.ninja_security_group
  tags                                 = var.tags
  no_of_subnets                        = var.no_of_subnets
  db_subnet_group_name                 = var.db_subnet_group_name
  db_instance_metadata                 = var.db_instance_metadata
  db_instance_username                 = var.db_instance_username
  db_instance_password                 = var.db_instance_password
  db_instance_publicly_accessible_bool = var.db_instance_publicly_accessible_bool
  db_instance_skip_final_snapshot_bool = var.db_instance_skip_final_snapshot_bool
  db_instance_parameter_group          = var.db_instance_parameter_group
  db_instance_parameters_map           = var.db_instance_parameters_map
}

module "S3" {
  source     = "./modules/S3"
  depends_on = [module.RDS]

  tags        = var.tags
  s3_metadata = var.s3_metadata
}

module "Lambda" {
  source     = "./modules/Lambda"
  depends_on = [module.S3]

  ninja_s3_bucket         = module.S3.ninja_s3_bucket
  tags                    = var.tags
  db_instance_metadata    = var.db_instance_metadata
  sar_application         = var.sar_application
  sar_application_version = var.sar_application_version
}