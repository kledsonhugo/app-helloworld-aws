output "ec2_public_fqdn" {
  value = aws_instance.hello-instance.public_dns
  description = "FQDN público da máquina virtual EC2"
}