output "bastion_public_ip" {
  value = module.ec2-bastion.public_ip

}


output "ec2_private_private_ip" {
  value = module.ec2-private.private_ip

}

output "bastion_public_instance_id" {
  value = module.ec2-bastion.id

}

output "ec2_private_instance_id" {
  value = module.ec2-private.id

}
