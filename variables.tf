variable "emulator_credentials_path" {
  type        = string
  description = "Ruta al archivo de credenciales del emulador AWS"
}

variable "vpn_ip" {
  default     = null
  type        = string
  description = "IP address of the VPN client that will be allowed to access the application and SSH ports"
}

variable "app_port" {
  default     = 0
  description = "Port number for the application"
  type        = number
  nullable    = false
  sensitive   = false
}

variable "ssh_port" {
  default     = 0
  description = "Port number for SSH access"
  type        = number
  nullable    = false
  sensitive   = false
  validation {
    condition     = var.ssh_port == 22
    error_message = "SSH port must be 22"
  }
}

variable "instance_type" {
  type        = list(string)
  default     = ["t3.micro", "t3.small", "t3.medium"]
  description = "Type of EC2 instance to launch"
  nullable    = false
  sensitive   = false
}

variable "instance_types_env" {
  type = map(string)
  default = {
    dev   = "t3.micro"
    pre    = "t3.small"
    pro = "t3.medium"
  }
}

variable "environment" {
    default = ""
}