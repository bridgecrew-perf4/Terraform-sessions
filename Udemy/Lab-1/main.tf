provider "aws" {
    region = "us-east-1"

}

resource "aws_instance" "test_ec2" {
ami = "ami-0d5eff06f840b45e9"
instance_type = "t2.micro" 
key_name = aws_key_pair.ec2_key.id
tags = {
    Name = "Web_instance"
    Project = "Udemy"
    Owner = "Solongo"
 }
}

resource "aws_key_pair" "ec2_key" {
    key_name = "public_key"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDSKDymJ8/06ju8lq8Z45ftW9So9QTm/QT37uLdNHDHq6eIeEZZb0Z6b9xbkMR0PniStuKupBYH9/14uQjosZH5o2FRgefE2PqJMc2SjDPb+Q8jsAjA1xPRVAsV7gmoK+dPjO/zg0LEE4juPl/yVUd9nCY58kGsE3rm2xRLo+lQxTEHCxIDXg5nx46Sn8JBGdCN+ib60M6F/hOP6UuETN+uAsHfM5FAk9NQl8bD4pFlnMAwMBgA7tUU+b3V3JQmlluFdI5GK8nO7oI290VvfbG3tTr31yZLwaj8KK2xC7bn8D53rJu1Bcg3LG7PK4KjfgvANUd3ZS092yjKNWFV1acd solongoganbold@Solongos-MBP"

}