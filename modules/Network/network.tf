resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_ip_range
  enable_dns_support   = var.enable_dns_support_bool
  enable_dns_hostnames = var.enable_dns_hostnames_bool

  tags = var.tags
}

resource "aws_subnet" "subnetworks" {
  count = var.subnet_count

  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = element(var.cidr_blocks, count.index)
  availability_zone       = element(var.availability_zones, count.index)
  map_public_ip_on_launch = var.map_public_ip_on_launch_bool

  tags = var.tags
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = var.tags
}

resource "aws_route_table" "rtb" {
  vpc_id = aws_vpc.vpc.id

  tags = var.tags

  route {
    cidr_block = var.route_table_ip_range
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "rtb_association" {
  count = var.subnet_count

  subnet_id      = element(aws_subnet.subnetworks.*.id, count.index)
  route_table_id = aws_route_table.rtb.id
}