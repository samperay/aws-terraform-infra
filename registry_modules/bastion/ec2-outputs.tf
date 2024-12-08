output "bastion_public_ip" {
  value = module.ec2-bastion.public_ip

}

output "bastion_public_instance_id" {
  value = module.ec2-bastion.id

}