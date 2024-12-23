# public security group id

output "public_security_group_name" {
  value = module.bastion-public-sg.security_group_name

}

output "public_security_group_id" {
  value = module.bastion-public-sg.security_group_id
}

output "public_security_group_vpc_id" {
  value = module.bastion-public-sg.security_group_vpc_id
}

# private security group id

output "private_security_group_name" {
  value = module.bastion-private-sg.security_group_name

}

output "private_security_group_id" {
  value = module.bastion-private-sg.security_group_id
}

output "private_security_group_vpc_id" {
  value = module.bastion-private-sg.security_group_vpc_id
}