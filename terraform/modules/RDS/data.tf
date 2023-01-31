data "aws_vpc" "ninja_vpc" {
  id = var.aws_vpc.id
}

data "aws_subnet" "ninja_subnet" {
  count = var.no_of_subnets
  id    = element(var.aws_subnet.*.id, count.index)
}

data "aws_internet_gateway" "ninja_igw" {
  internet_gateway_id = var.aws_internet_gateway.id
}

data "aws_security_group" "ninja_sg" {
  id = var.aws_security_group.id
}