module "vpc" {
  source            = "../custom_modules/vpc"
  vpc_cidr          = var.vpc_cidr
  region            = var.region
  public_subnet_az1 = var.public_subnet_az1
}

module "aws_keyname" {
  source   = "../custom_modules/key_pair"
  key_name = "demo"
}

module "security_group" {
  source  = "../custom_modules/sg"
  sg_name = "allow_network_traffic"
  vpc_id  = module.vpc.vpc_id
}



module "ec2" {
  depends_on        = [module.vpc]
  source            = "../custom_modules/ec2"
  instance_type     = var.instance_type
  region            = var.region
  subnet_id         = module.vpc.aws_subnet_id
  security_group_id = module.security_group.sg_id
  key_name          = module.aws_keyname.key_name
}