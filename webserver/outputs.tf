output "instance_id" {
  value = module.ec2.instance_id

}

output "instance_public_ip" {
  value = module.ec2.public_ip
}

output "vpc_id" {
  value = module.vpc.vpc_id

}

output "subnet_id" {
  value = module.vpc.aws_subnet_id

}

output "security_group_id" {
  value = module.security_group.sg_id
}