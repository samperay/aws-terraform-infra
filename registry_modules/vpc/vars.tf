variable "environment" {
  description = "environment type for deployment"
  type        = string
  default     = "dev"
}

variable "business" {
  description = "business vertical you are placed"
  type        = string
  default     = "cloudops"
}

## VPC environment vars

variable "vpc_name" {
  description = "name of your vpc"
  type        = string
  default     = "my-vpc"
}


variable "vpc_cidr_block" {
  description = "cidr range of vpc"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_availability_zones" {
  description = "VPC Availability Zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}


variable "vpc_private_subnets" {
  description = "VPC Private Subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "vpc_public_subnets" {
  description = "VPC Public Subnets"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}

## VPD Databse subnets

# variable "vpc_database_subnets" {
#   description = "VPC Database Subnets"
#   type        = list(string)
#   default     = ["10.0.151.0/24", "10.0.152.0/24"]
# }

# # VPC Create Database Subnet Group (True / False)
# variable "vpc_create_database_subnet_group" {
#   description = "VPC Create Database Subnet Group"
#   type        = bool
#   default     = true
# }

# # VPC Create Database Subnet Route Table (True or False)
# variable "vpc_create_database_subnet_route_table" {
#   description = "VPC Create Database Subnet Route Table"
#   type        = bool
#   default     = true
# }

# VPC Enable NAT Gateway (True or False) 
variable "vpc_enable_nat_gateway" {
  description = "Enable NAT Gateways for Private Subnets Outbound Communication"
  type        = bool
  default     = true
}

# VPC Single NAT Gateway (True or False)
variable "vpc_single_nat_gateway" {
  description = "Enable only single NAT Gateway in one Availability Zone to save costs during our demos"
  type        = bool
  default     = true
}