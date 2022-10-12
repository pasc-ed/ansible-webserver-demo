output "instance_public_ip_addr" {
  value = aws_instance.web_server[*].public_ip
}