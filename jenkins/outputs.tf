output "instance_id" {
  value = aws_instance.jenkins.id

}

output "public_id" {
  value = aws_eip.jenkins_eip.public_ip

}