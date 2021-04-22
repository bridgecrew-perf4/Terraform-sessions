resource "aws_instance" "wordpress-web" {
  ami           = data.aws_ami.amazon_linux_2.image_id
  instance_type = var.instance_type
  key_name = aws_key_pair.task-key.key_name
  vpc_security_group_ids = [aws_security_group.web.id]
  subnet_id = aws_subnet.public-subnet-1.id
  associate_public_ip_address = true
  user_data = file("userdata.sh")

tags = {
    Name = var.instance_name
    Project = var.project_name
    Environment = var.env
  }
}

