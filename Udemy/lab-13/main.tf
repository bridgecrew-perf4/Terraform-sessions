provider "aws" {
    region = "us-east-1"
}

data "aws_instance" "lab-13_ec2" {
  owners = ["137112412989"]
  most_recent = true
  filter {
      name = "name"
      values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_security_group" "web" {
    name = "Web_SG"
    dynamic "ingress" {
        for_each = ["80", "443"]
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
        Name = "Web_SG"
        Project = "Udemy"

    }
}
resource "launch_configuration" "web" {
    name = "any"
    image_id = data.aws_instance.lab-13_ec2.id
    instance_type = t2.micro
    lifecycle {
        create_before_destroy = true
    }
}

resource "aws_autoscaling_group" {
    name = 
}