resource "aws_security_group" "nginx-server-sg" {
  description = "Security group allowing HTTP(port 80) and HTTPS(port 443)"
  name        = "nginx-server-sg"
  vpc_id      = aws_vpc.project01-vpc.id

  # Allow inbound HTTP traffic on port 80
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = merge(local.common_tags, {
    Name = "nginx-server-sg"
  })

}