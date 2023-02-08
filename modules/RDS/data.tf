data "aws_subnet" "subnetworks" {
  count = var.subnet_count
  id    = element(var.subnetworks.*.id, count.index)
}

data "aws_security_group" "security_group" {
  id = var.security_group.id
}