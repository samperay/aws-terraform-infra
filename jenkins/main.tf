data "aws_ami" "amzlinux2" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-gp2"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

resource "aws_instance" "jenkins" {
  ami                         = data.aws_ami.amzlinux2.id
  associate_public_ip_address = true
  instance_type               = "t2.medium"
  subnet_id                   = aws_subnet.public-subnet.id
  vpc_security_group_ids      = [aws_security_group.jenkins-server-sg.id]
  key_name                    = "demo"


  root_block_device {
    delete_on_termination = true
    volume_size           = 20
    volume_type           = "gp2"
  }

  user_data = <<-EOF
                #!/bin/bash
                sudo yum update –y
                sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
                sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
                sudo yum install java-17-amazon-corretto docker git pip pytest -y
                sudo yum install jenkins -y
                sudo systemctl enable jenkins
                sudo systemctl start jenkins
                sudo systemctl status jenkins
                sudo systemctl start docker.service
                sudo systemctl enable docker.service
                sudo cat /var/lib/jenkins/secrets/initialAdminPassword
                sudo usermod -a -G docker ec2-user
                sudo usermod -a -G docker jenkins
                sudo chown jenkins /var/run/docker.sock
                EOF

  tags = merge(local.common_tags, {
    Name = "jenkins"
  })

  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_eip" "jenkins_eip" {
  depends_on = [aws_instance.jenkins]
  instance   = aws_instance.jenkins.id
  domain     = "vpc"
}

