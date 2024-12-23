module "bastion-private-sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.2.0"


  name        = "bastion-private-sg"
  description = "Security group for user-service with custom ports open within VPC, and PostgreSQL publicly open"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = [module.vpc.vpc_cidr_block]
  ingress_rules       = ["ssh-tcp", "http-80-tcp"]
  egress_rules        = ["all-all"]

  tags = local.common_tags
}