resource "aws_eip" "elastic-ip" {
  instance = aws_instance.ec2.id
  domain   = "vpc"
}