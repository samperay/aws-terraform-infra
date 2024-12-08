module "bastion-public-sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.2.0"


  name        = "bastion-public-sg"
  description = "Security group for user-service with custom ports open within VPC, and PostgreSQL publicly open"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["ssh-tcp"]
  egress_rules        = ["all-all"]

  tags = local.common_tags
}