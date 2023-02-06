module "Network" {
  source = "./modules/Network"

  tags                      = var.tags
  subnet_count              = var.subnet_count
  cidr_blocks               = var.cidr_blocks
  availability_zones        = var.availability_zones
  ingress_rule_one          = var.ingress_rule_one
  ingress_rule_two          = var.ingress_rule_two
  egress_rule               = var.egress_rule
  vpc_ip_range              = var.vpc_ip_range
  enable_dns_support_bool   = var.enable_dns_support_bool
  enable_dns_hostnames_bool = var.enable_dns_hostnames_bool
  route_table_ip_range      = var.route_table_ip_range
  security_group            = var.security_group
}

module "RDS" {
  source     = "./modules/RDS"
  depends_on = [module.Network]

  ninja_vpc              = module.Network.ninja_vpc
  ninja_subnets          = module.Network.ninja_subnets
  ninja_internet_gateway = module.Network.ninja_internet_gateway
  ninja_security_group   = module.Network.ninja_security_group
  tags                   = var.tags
  subnet_count           = var.subnet_count
  db_subnet_group_name   = var.db_subnet_group_name
  db_instance_metadata   = var.db_instance_metadata
  db_instance_username   = var.db_instance_username
  db_instance_password   = var.db_instance_password
  db_instance_params     = var.db_instance_params
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

  ninja_s3_bucket      = module.S3.ninja_s3_bucket
  tags                 = var.tags
  db_instance_metadata = var.db_instance_metadata
}