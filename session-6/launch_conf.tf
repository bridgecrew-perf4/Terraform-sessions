resource "aws_launch_configuration" "webserver_lc" {
  name = "${var.env}-webserver_lc"
  image_id      = data.aws_ami.amazon_linux2.id
  instance_type = var.instance_type
  user_data = data.template_file.webserver.rendered
  security_groups = [aws_security_group.webserver_sg.id]
}

