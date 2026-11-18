resource "aws_security_group" "security_group" {
  name        = "terraform-security-group"
  description = "Security Group managed by terraform that allows all traffic"

  tags = {
    Name = "tf-security-group"
  }
}

resource "aws_vpc_security_group_ingress_rule" "app_port_rule" {
  security_group_id = aws_security_group.security_group.id
  cidr_ipv4         = var.vpn_ip
  from_port         = var.app_port
  ip_protocol       = "tcp"
  to_port           = var.app_port
}

resource "aws_vpc_security_group_ingress_rule" "ssh_port_rule" {
  security_group_id = aws_security_group.security_group.id
  cidr_ipv4         = var.vpn_ip
  from_port         = var.ssh_port
  ip_protocol       = "tcp"
  to_port           = var.ssh_port
}


resource "aws_vpc_security_group_egress_rule" "allow_all_egress_traffic_ipv4" {
  security_group_id = aws_security_group.security_group.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
