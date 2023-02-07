resource "aws_security_group" "rds_optimizer_security_group" {
  name        = var.rds_logs_security_group["name"]
  description = var.rds_logs_security_group["description"]
  vpc_id      = aws_vpc.rds_optimizer_vpc.id

  tags = var.rds_logs_tags

  ingress {
    description = var.rds_logs_ingress_rule_one["description"]
    from_port   = var.rds_logs_ingress_rule_one["from_port"]
    to_port     = var.rds_logs_ingress_rule_one["to_port"]
    protocol    = var.rds_logs_ingress_rule_one["protocol"]
    cidr_blocks = ["${var.my_ip_address}/32"]
  }

  ingress {
    description = var.rds_logs_ingress_rule_two["description"]
    from_port   = var.rds_logs_ingress_rule_two["from_port"]
    to_port     = var.rds_logs_ingress_rule_two["to_port"]
    protocol    = var.rds_logs_ingress_rule_two["protocol"]
    cidr_blocks = ["${var.my_ip_address}/32"]
  }

  egress {
    description      = var.rds_logs_egress_rule["description"]
    from_port        = var.rds_logs_egress_rule["from_port"]
    to_port          = var.rds_logs_egress_rule["to_port"]
    protocol         = var.rds_logs_egress_rule["protocol"]
    cidr_blocks      = [var.rds_logs_egress_rule["cidr_blocks"]]
    ipv6_cidr_blocks = [var.rds_logs_egress_rule["ipv6_cidr_blocks"]]
  }
}