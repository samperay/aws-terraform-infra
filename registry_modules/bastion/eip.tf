resource "aws_eip" "bastion_eip" {
  depends_on = [module.vpc, module.ec2-bastion]
  instance   = module.ec2-bastion.id
  domain     = "vpc"


  provisioner "local-exec" {
    command     = "echo Destroy time prov `date` >> destroy-time-prov.txt"
    working_dir = "outputs/"
    when        = destroy
  }

}