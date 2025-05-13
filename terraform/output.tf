output "ec2_public_url" {
  value = "http://${aws_instance.hello-instance.public_dns}"
  description = "URL pública da máquina virtual EC2"
}