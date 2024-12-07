data "aws_ami" "amazon_ami" {

  most_recent = true
  owners      = ["137112412989"] # Amazon

  filter {
    name   = "name"
    values = ["amzn2-ami-amd-*-x86_64-gp2"]
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

resource "aws_instance" "instance" {
  ami                    = data.aws_ami.amazon_ami.id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  key_name               = var.key_name
  vpc_security_group_ids = [var.security_group_id]


  tags = {
    Name      = "amazon linux instance"
    Terraform = "true"
  }
}


resource "aws_eip" "instance_ip" {
  instance = aws_instance.instance.id
  domain   = "vpc"
}