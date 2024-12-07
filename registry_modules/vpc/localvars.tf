locals {
  owners      = var.business
  environment = var.environment
  
  common_tags = {
    owners      = local.owners
    environment = local.environment
    terraform   = true
  }
}