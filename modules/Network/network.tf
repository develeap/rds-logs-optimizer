resource "aws_vpc" "rds_optimizer_vpc" {
  cidr_block           = var.rds_logs_vpc_ip_range
  enable_dns_support   = var.enable_dns_support_bool
  enable_dns_hostnames = var.enable_dns_hostnames_bool

  tags = var.rds_logs_tags
}

resource "aws_subnet" "rds_optimizer_subnetworks" {
  count = var.rds_logs_subnet_count

  vpc_id                  = aws_vpc.rds_optimizer_vpc.id
  cidr_block              = element(var.rds_logs_cidr_blocks, count.index)
  availability_zone       = element(var.rds_logs_availability_zones, count.index)
  map_public_ip_on_launch = var.map_public_ip_on_launch_bool

  tags = var.rds_logs_tags
}

resource "aws_internet_gateway" "rds_optimizer_igw" {
  vpc_id = aws_vpc.rds_optimizer_vpc.id

  tags = var.rds_logs_tags
}

resource "aws_route_table" "rds_optimizer_rtb" {
  vpc_id = aws_vpc.rds_optimizer_vpc.id

  tags = var.rds_logs_tags

  route {
    cidr_block = var.rds_logs_route_table_ip_range
    gateway_id = aws_internet_gateway.rds_optimizer_igw.id
  }
}

resource "aws_route_table_association" "rds_optimizer_rtb_association" {
  count = var.rds_logs_subnet_count

  subnet_id      = element(aws_subnet.rds_optimizer_subnetworks.*.id, count.index)
  route_table_id = aws_route_table.rds_optimizer_rtb.id
}