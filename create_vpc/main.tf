module "test_vpc" {
  source            = "../modules/vpc"
  vpc_cidr          = var.vpc_cidr
  region            = var.region
  public_subnet_az1 = var.public_subnet_az1
}