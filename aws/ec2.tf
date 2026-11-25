resource "aws_instance" "ec2" {
  ami               = "ami-0aacbf72109c53c0c" # Amazon Linux 2 AMI (HVM), SSD Volume Type
  instance_type     = var.instance_type[0]    # t3.micro
  availability_zone = "us-east-1a"
  count             = 3

  tags = {
    Name = "terraform-instance-${count.index + 1}"
  }
}

resource "aws_instance" "ec2-2" {
  ami               = "ami-0aacbf72109c53c0c"                                                                  # Amazon Linux 2 AMI (HVM), SSD Volume Type
  instance_type     = var.environment == "dev" ? var.instance_types_env["dev"] : var.instance_types_env["pro"] # t3.micro or t3.medium based on environment
  availability_zone = "eu-central-1a"
}
