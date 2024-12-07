module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc_name
  cidr = var.vpc_cidr_block

  azs             = var.vpc_availability_zones
  private_subnets = var.vpc_private_subnets
  public_subnets  = var.vpc_public_subnets

  # at moment commenting out db subnets to save cost.

  # database_subnets                   = var.vpc_database_subnets
  # create_database_subnet_group       = var.vpc_create_database_subnet_group
  # create_database_subnet_route_table = var.vpc_create_database_subnet_route_table

  enable_nat_gateway = var.vpc_enable_nat_gateway
  single_nat_gateway = var.vpc_single_nat_gateway

  # tags for all resources
  tags     = local.common_tags
  vpc_tags = local.common_tags

  # additional tags for subnets
  public_subnet_tags = {
    Type = "Public Subnets"
  }
  private_subnet_tags = {
    Type = "Private Subnets"
  }
  # database_subnet_tags = {
  #   Type = "Private Database Subnets"
  # }

}