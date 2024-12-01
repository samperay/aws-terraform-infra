module "create_vpc" {
  source            = "../custom_modules/vpc"
  cidr_block        = var.cidr_block
  region            = var.region
  public_subnet_az1 = var.public_subnet_az1
}