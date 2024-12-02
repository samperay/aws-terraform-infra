module "vpc" {
  source            = "../custom_modules/test-vpc"
  vpc_cidr          = var.vpc_cidr
  region            = var.region
  public_subnet_az1 = var.public_subnet_az1
}


module "ec2" {
  source        = "../custom_modules/ec2"
  instance_type = var.instance_type
  region        = var.region
  subnet_id     = var.public_subnet_az1
}