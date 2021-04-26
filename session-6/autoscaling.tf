resource "aws_autoscaling_group" "webserver-sg" {
name                      = "${var.env}-webserver-asg"
max_size                  = 2
min_size                  = 1
health_check_grace_period = 300
health_check_type         = "EC2"
desired_capacity          = 1
// force_delete              = true
//   placement_group           = aws_placement_group.test.id
launch_configuration      = aws_launch_configuration.webserver_lc.name
vpc_zone_identifier       = data.aws_subnet_ids.default.ids # subnet set on avail zone, vpc identifier means subnet
}

resource "aws_autoscaling_attachment" "asg_attachment_lb" {
  autoscaling_group_name = aws_autoscaling_group.webserver-sg.id
  alb_target_group_arn   = aws_lb_target_group.webserver-tg.arn
}

