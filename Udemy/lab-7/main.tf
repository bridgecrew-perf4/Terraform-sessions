provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "web" {
    ami = "ami-0d5eff06f840b45e9"
    instance_type = "t2.micro"
    tags = { Name = "Web-Server" }
    depends_on = [aws_instance.app,aws_instance.db]
}

resource "aws_instance" "app" {
    ami = "ami-0d5eff06f840b45e9"
    instance_type = "t2.micro"
    tags = { Name = "App-Server" }
    depends_on = [aws_instance.db]
    
}

resource "aws_instance" "db" {
    ami = "ami-0d5eff06f840b45e9"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.general.id]
    tags = { Name = "Db-Server" }
    
}

resource "aws_security_group" "general" {
name = "general_ports"
description = "Allow Rules"

dynamic "ingress" {
    for_each = ["80", "443", "22",]
    content {
        from_port = ingress.value
        to_port = ingress.value
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
 }
}

egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
}

tags = {
    Name = "General Security Group"
    Project = "udemy"
    Owner = "Solongo"
  }
 }
