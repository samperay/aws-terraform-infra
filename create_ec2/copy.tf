resource "null_resource" "copy_install_script" {
    depends_on = [ module.ec2, module.vpc ]

    connection {
      type = "ssh"
      host = module.ec2.public_ip
      user = "ec2-user"
      password = ""
      private_key = file("./demo")
    }

    provisioner "file" {
        source = "./install.sh"
        destination = "/tmp/install.sh"
      
    }

    provisioner "remote-exec" {
      inline = [ "sudo chmod 777 /tmp/install.sh" ]
    }

    provisioner "local-exec" {
        command = "Display date and time of execution : `date`"
    }

}