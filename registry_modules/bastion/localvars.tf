locals {
  owner       = var.business
  business    = var.business
  environment = var.environment
  name        = "${var.business}-${var.environment}"

  common_tags = {
    owners      = local.owner
    environment = local.environment
    name        = local.name
  }
} 