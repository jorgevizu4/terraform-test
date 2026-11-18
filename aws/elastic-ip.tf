resource "aws_eip" "elastic_ip" {
  instance = aws_instance.ec2.id
  domain   = "vpc"
}