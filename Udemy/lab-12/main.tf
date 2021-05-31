provider "aws" {
    region = "us-east-1"
}
data "aws_availability_zone" "working" {}
resource "aws_instance" "ec2" {
    ami = data.aws_ami.amazon_linux.id
    instance_type = "t2.micro"
}

data "aws_ami" "amazon_linux" {
    owners = ["137112412989"]
    most_recent = true
    filter {
        name = "name"
        values = ["amzn2-ami-hvm-*-x86_64-gp2"]
    }
}

output "amazon_linux" {
    value = data.aws_ami.amazon_linux.id
}