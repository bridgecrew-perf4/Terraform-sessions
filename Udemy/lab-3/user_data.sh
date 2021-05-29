#!/bin/bash
sudo yum install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd
sudo echo "Hello from Web Instance" > /var/www/html/index.html
sudo chown -R apache:apache /var/www/html
