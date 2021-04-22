vpc_cidr_block = "10.0.0.0/16"
env = "dev"
project_name = "terraform_wordpress"

cidr_block = "0.0.0.0/0"

cidr_block_public_subnet1 = "10.0.1.0/24"
cidr_block_public_subnet2 = "10.0.2.0/24"
cidr_block_public_subnet3 = "10.0.3.0/24"

cidr_block_private_subnet1 = "10.0.11.0/24"
cidr_block_private_subnet2 = "10.0.12.0/24"
cidr_block_private_subnet3 = "10.0.13.0/24"

instance_type = "t2.micro"

web-ingress = "80"

ssh-ingress = "22"

mysql-ingress = "3306"

protocol = "tcp"

egress-all = "0"

egress-protocol = "-1"

instance_name = "Wordpress-Web"

database-sg = "mysql-sg"

database-instance_name = "Wordpress-Database"

wordpress-sg = "web-sg"