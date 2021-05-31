provider "aws" {
    region = "us-east-1"
}
data "aws_region" "current" {}
###### Conditions ##########
resource "aws_instance" "lab19_instance" {
ami = var.ami[data.aws_region.current.name] # "ami-0d5eff06f840b45e9"
instance_type = lookup(var.server_size, var.env, var.server_size["dev"])
vpc_security_group_ids = [aws_security_group.lab19_sg.id]
root_block_device {
    volume_size = 2
    encrypted = var.env == "prod" ? true : false # Conditions
# Conditions= instance_type = var.env == "prod" ? "t3.large" : "t2.micro"

}

# Usind Dynamic if it's prod create ebs, if other env not to create.
dynamic "ebs_block_device" {
    for_each = var.env == "prod" ? [true] : []
    content {
    device_name = "/dev/sdb"
    volume_size = 1
    
    }
  }
volume_tags = { Name = "Disk-${var.env}" }
tags =  { Name = "Server-${var.env}" }
}

resource "aws_security_group" "lab19_sg" {
    name = "SG"
    dynamic "ingress" {
        for_each = ["22", "80", "443"]
        content {
            from_port = ingress.value
            to_port = ingress.value
            protocol = "tcp"
            cidr_blocks = [ "0.0.0.0/0" ]
        }
    }

############## Look up Function ###########
# Lookup function is used for map. 
// resource "aws_security_group" "lab19_sg" {
//     name = "SG"
//     dynamic "ingress" {
//         for_each = lookup(var.allow_port, var.env, var.allow_port["dev"])
//         content {
//             from_port = ingress.value
//             to_port = ingress.value
//             protocol = "tcp"
//             cidr_blocks = [ "0.0.0.0/0" ]
//         }
//     }
    
# var.allow_port=map, var.env=key, var.allow_port[dev]=if env is different use other ports
# instance_type =lookup(var.server_size, "prod", "t3.nano")
#
############################################################
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks  = ["0.0.0.0/0"]
    }
 tags = {
     Name = "Dynamic SG"
     Owner = "Solongo"
 }

}