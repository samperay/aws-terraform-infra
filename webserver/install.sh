#! /bin/bash
sudo yum update -y
sudo yum install -y httpd
sudo systemctl enable httpd
sudo service httpd start  
sudo echo "<h1>Welcome to Sunil's webserver using terraform</h1>" | sudo tee /var/www/html/index.html