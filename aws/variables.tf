variable "vpn_ip" {
    default = "0.0.0.0/0"
    description = "IP address of the VPN client that will be allowed to access the application and SSH ports"
}

variable "app_port" {
    default = 8080
    description = "Port number for the application"
    type = number
    nullable = false
    sensitive = false
}

variable "ssh_port" {
    default = 22
    description = "Port number for SSH access"
    type = number
    nullable = false
    sensitive = false
    validation {
        condition = var.ssh_port == 22
        error_message = "SSH port must be 22"
    }
}