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

module "ec2-bastion" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.7.1"


  name                   = "${var.environment}-bastion}"
  ami                    = data.aws_ami.amzlinux2.id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [module.bastion-public-sg.security_group_id]
  subnet_id              = module.vpc.public_subnets[0]
  tags                   = local.common_tags
}