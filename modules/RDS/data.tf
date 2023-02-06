data "aws_subnet" "rds_optimizer_subnetworks" {
  count = var.rds_logs_subnet_count
  id    = element(var.rds_optimizer_subnetworks.*.id, count.index)
}

data "aws_security_group" "rds_optimizer_security_group" {
  id = var.rds_optimizer_security_group.id
}