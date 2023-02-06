data "aws_vpc" "ninja_vpc" {
  id = var.ninja_vpc.id
}

data "aws_subnet" "ninja_subnets" {
  count = var.subnet_count
  id    = element(var.ninja_subnets.*.id, count.index)
}

data "aws_internet_gateway" "ninja_igw" {
  internet_gateway_id = var.ninja_internet_gateway.id
}

data "aws_security_group" "ninja_sg" {
  id = var.ninja_security_group.id
}