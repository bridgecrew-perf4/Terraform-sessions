provider "aws" {
    region = var.region
}

resource "aws_instance" "ec2" {
    ami = data.aws_ami.amazon_linux.id
    instance_type = var.instance_type
    tags = merge(var.tags, { Name = "${var.tags["env"]} - Amazon_ec2" })
}
data "aws_ami" "amazon_linux" {
    owners = ["137112412989"]
    most_recent = true
    filter {
        name = "name"
        values = ["amzn2-ami-hvm-*-x86_64-gp2"]
    }
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
tags = merge(var.tags, { Name = "${var.tags["env"]} -Web-SG"})
}

