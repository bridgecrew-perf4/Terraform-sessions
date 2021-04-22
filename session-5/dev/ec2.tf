resource "aws_instance" "my_instance" {
  ami                    = data.aws_ami.amazon_linux_2.image_id  # data source starts with "data"
  instance_type          = var.instance_type                     # variable
  key_name               = aws_key_pair.first_key.key_name       #resource reference
  vpc_security_group_ids = [aws_security_group.first_sg.id]      #resource reference
  user_data              = data.template_file.user_data.rendered #rendered means read from template file     #user_data = file("user.data.sh") #using function for userdata


  tags = {
    Name = "${var.env}-Instance" # variable with surfix and prefix ""
    # Name2 = format("Instance-%s" , var.env) both same to make print something. "Both Format function"
  }
}
