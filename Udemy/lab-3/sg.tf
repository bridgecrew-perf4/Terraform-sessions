resource "aws_security_group" "web" {
name = "WebServer-SG"
description = "SG for a WebServer"
ingress {
   from_port = 80
   to_port = 80
   protocol = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
 }
 ingress {
   from_port = 443
   to_port = 443
   protocol = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
 }
egress {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]

}
tags = {
    Name = "web_sg"
    Project = "udemy"
    Owner = "Solongo"
 }
}