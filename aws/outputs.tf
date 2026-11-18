output "public_ip" {
  value = aws_eip.elastic_ip.public_ip
  description = "Public IP address of the Elastic IP"
}