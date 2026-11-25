resource "aws_instance" "ec2-1" {
  ami           = "ami-0aacbf72109c53c0c" # Amazon Linux 2 AMI (HVM), SSD Volume Type
  instance_type = var.instance_type[0] # t3.micro
  availability_zone = "us-east-1a"

  tags = {
    Name = "Instancia Terraform 1"
  }
}

resource "aws_instance" "ec2-2" {
  ami           = "ami-0aacbf72109c53c0c" # Amazon Linux 2 AMI (HVM), SSD Volume Type
  instance_type = var.types["us-east-1"] # t3.small
  availability_zone = "us-east-1a"

  tags = {
    Name = "Instancia Terraform 2"
  }
}