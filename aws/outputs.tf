output "public-ip" {
  value = aws_eip.elastic-ip.public_ip
  description = "Public IP address of the Elastic IP"
}