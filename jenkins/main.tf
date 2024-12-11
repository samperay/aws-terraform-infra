resource "aws_instance" "nginx-server" {
  ami                         = aws_ami.amzlinux2.id
  associate_public_ip_address = true
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public-subnet.id
  vpc_security_group_ids      = [aws_security_group.nginx-server-sg.id]


  root_block_device {
    delete_on_termination = true
    volume_size           = 10
    volume_type           = "gp3"
  }

  user_data = <<-EOF
                #!/bin/bash
                sudo apt-get update -y
                sudo apt-get install -y nginx
                sudo systemctl start nginx
                sudo systemctl enable nginx
                EOF

  tags = merge(local.common_tags, {
    Name = "project01-nginx-server"
  })

  lifecycle {
    create_before_destroy = true
  }
}