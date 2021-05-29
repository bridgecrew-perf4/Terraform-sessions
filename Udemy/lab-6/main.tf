provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "web" {
ami = "ami-0d5eff06f840b45e9"
instance_type = "t2.micro"
vpc_security_group_ids = [aws_security_group.web.id]
user_data = file("user_data.sh") # Static file functions
tags = {
    Name = "web"
    Project = "udemy"
    Owner = "Solongo" 
 }

 lifecycle {
     create_before_destroy = true #NO DOWNTIME. New ec2 create then old ec2 will destroyed. 
 }
}

resource "aws_eip" "elastic_ip" {
    instance = "aws_instance.web.id"
    tags = {
        Name = "Elastic_ip"
        Project = "udemy"
        Owner = "Solongo"
    }
}