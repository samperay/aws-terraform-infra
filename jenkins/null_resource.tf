resource "null_resource" "name" {
  depends_on = [aws_instance.jenkins]
  # Connection Block for Provisioners to connect to EC2 Instance
  connection {
    type        = "ssh"
    host        = aws_eip.jenkins_eip.public_ip
    user        = "ec2-user"
    password    = ""
    private_key = file("./demo")
  }
}
