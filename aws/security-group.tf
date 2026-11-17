resource "aws_security_group" "security-group" {
  name        = "terraform-security-group"
  description = "`Security Group managed by terraform that allows all traffic"

  tags = {
    Name = "tf-sg-AllowAll"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.security-group.id
  cidr_ipv4         = "${aws_eip.elastic-ip.public_ip}/32"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}


resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.security-group.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
