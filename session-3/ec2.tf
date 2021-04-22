resource "aws_instance" "my_instance" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name
    vpc_security_group_ids = [aws_security_group.first_sg.id]
    user_data = file("user.data.sh")
   

    tags = {
        Name = var.env 
    }
}
