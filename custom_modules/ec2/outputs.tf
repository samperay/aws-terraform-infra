output "instance_id" {
  value = aws_instance.instance.id
}

output "public_ip" {
  value = aws_eip.instance_ip.public_ip

}