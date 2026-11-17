resource "aws_instance" "ec2" {
  ami           = "ami-017c8c0d88ce880d8" # Amazon Linux 2 AMI (HVM), SSD Volume Type
  instance_type = "t3.micro"

  tags = {
    Name = "Instancia Terraform"
  }
}