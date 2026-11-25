variable "vpn_ip" {
    description = "IP address of the VPN client that will be allowed to access the application and SSH ports"
}

variable "app_port" {
    description = "Port number for the application"
    type = number
    nullable = false
    sensitive = false
}

variable "ssh_port" {
    description = "Port number for SSH access"
    type = number
    nullable = false
    sensitive = false
    validation {
        condition = var.ssh_port == 22
        error_message = "SSH port must be 22"
    }
}

variable "instance_type" {
    type = list(string)
    default = ["t3.micro", "t3.small", "t3.medium"]
    description = "Type of EC2 instance to launch"
    nullable = false
    sensitive = false
}

variable "types" {
    type = map(string)
    default = {
        eu-west-1 = "t3.micro"
        us-east-1 = "t3.small"
        eu-central-1 = "t3.medium"
    }
}