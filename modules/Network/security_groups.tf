resource "aws_security_group" "ninja_sg" {
  name        = var.security_group["name"]
  description = var.security_group["description"]
  vpc_id      = aws_vpc.ninja_vpc.id

  tags = var.tags

  ingress {
    description = var.ingress_rule_one["description"]
    from_port   = var.ingress_rule_one["from_port"]
    to_port     = var.ingress_rule_one["to_port"]
    protocol    = var.ingress_rule_one["protocol"]
    cidr_blocks = [var.ingress_rule_one["cidr_blocks"]]
  }

  ingress {
    description = var.ingress_rule_two["description"]
    from_port   = var.ingress_rule_two["from_port"]
    to_port     = var.ingress_rule_two["to_port"]
    protocol    = var.ingress_rule_two["protocol"]
    cidr_blocks = [var.ingress_rule_two["cidr_blocks"]]
  }

  egress {
    description      = var.egress_rule["description"]
    from_port        = var.egress_rule["from_port"]
    to_port          = var.egress_rule["to_port"]
    protocol         = var.egress_rule["protocol"]
    cidr_blocks      = [var.egress_rule["cidr_blocks"]]
    ipv6_cidr_blocks = [var.egress_rule["ipv6_cidr_blocks"]]
  }
}