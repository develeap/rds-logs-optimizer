resource "aws_vpc" "ninja_vpc" {
  cidr_block           = var.vpc_ip_range
  enable_dns_support   = var.enable_dns_support_bool
  enable_dns_hostnames = var.enable_dns_hostnames_bool

  tags = var.tags
}

resource "aws_subnet" "ninja_subnet" {
  count = var.no_of_subnets

  vpc_id                  = aws_vpc.ninja_vpc.id
  cidr_block              = element(var.cidr_block, count.index)
  availability_zone       = element(var.availability_zone, count.index)
  map_public_ip_on_launch = true

  tags = var.tags
}

resource "aws_internet_gateway" "ninja_igw" {
  vpc_id = aws_vpc.ninja_vpc.id

  tags = var.tags
}

resource "aws_route_table" "ninja_rtb" {
  vpc_id = aws_vpc.ninja_vpc.id

  tags = var.tags

  route {
    cidr_block = var.route_table_ip_range
    gateway_id = aws_internet_gateway.ninja_igw.id
  }
}

resource "aws_route_table_association" "ninja_rtb_association" {
  count = var.no_of_subnets

  subnet_id      = element(aws_subnet.ninja_subnet.*.id, count.index)
  route_table_id = aws_route_table.ninja_rtb.id
}