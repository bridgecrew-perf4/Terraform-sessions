#! /bin/bash
sudo yum update -y
sudo amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2
sudo yum install -y httpd mariadb-server
sudo yum install php-gd -y
sudo yum install mariadb -y 
sudo systemctl start httpd
sudo systemctl enable httpd
sudo wget 'https://wordpress.org/latest.tar.gz'
sudo tar -xzvf latest.tar.gz
sudo mv -r wordpress/* /var/www/html/index.html
echo "Terraform Wordpress Task" > /var/www/html/index.html
sudo chown -R apache:apache /var/www/html/
sudo systemctl restart httpd.service

