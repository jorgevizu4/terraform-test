resource "aws_instance" "ec2-1" {
  ami           = "ami-017c8c0d88ce880d8" # Amazon Linux 2 AMI (HVM), SSD Volume Type
  instance_type = var.instance_type[0] # t3.micro

  tags = {
    Name = "Instancia Terraform 1"
  }
}

resource "aws_instance" "ec2-2" {
  ami           = "ami-017c8c0d88ce880d8" # Amazon Linux 2 AMI (HVM), SSD Volume Type
  instance_type = var.types["eu-south-2"] # t3.small

  tags = {
    Name = "Instancia Terraform 2"
  }
}