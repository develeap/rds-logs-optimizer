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

  subnetworks          = module.Network.subnetworks
  security_group       = module.Network.security_group
  tags                 = var.tags
  subnet_count         = var.subnet_count
  db_subnet_group_name = var.db_subnet_group_name
  db_metadata          = var.db_metadata
  db_username          = var.db_username
  db_password          = var.db_password
  db_params            = var.db_params
}

module "S3" {
  source     = "./modules/S3"
  depends_on = [module.RDS]

  tags                         = var.tags
  s3_bucket_name               = var.s3_bucket_name
  s3_bucket_versioning_status  = var.s3_bucket_versioning_status
  block_public_acls_bool       = var.block_public_acls_bool
  block_public_policy_bool     = var.block_public_policy_bool
  ignore_public_acls_bool      = var.ignore_public_acls_bool
  restrict_public_buckets_bool = var.restrict_public_buckets_bool
  s3_bucket_sse_algorithm      = var.s3_bucket_sse_algorithm
}

module "Lambda" {
  source     = "./modules/Lambda"
  depends_on = [module.S3]

  s3_bucket   = module.S3.s3_bucket
  tags        = var.tags
  db_metadata = var.db_metadata
}