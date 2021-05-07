resource "aws_autoscaling_group" "webserver-autosg" {
name                      = "${var.env}-webserver-asg"
max_size                  = 5
min_size                  = 1
desired_capacity          = 1
health_check_grace_period = 300
health_check_type         = "EC2"
// force_delete              = true
//   placement_group           = aws_placement_group.test.id
launch_configuration      = aws_launch_configuration.webserver_lc.name
vpc_zone_identifier       = data.aws_subnet_ids.default.ids # subnet set on avail zone, vpc identifier means subnet
}

resource "aws_autoscaling_attachment" "asg_attachment_lb" { #HERE LOAD BALANCER attached TO AutoScaling Group
  autoscaling_group_name = aws_autoscaling_group.webserver-autosg.id # Even it says "Name" HERE is needed ID. 
  alb_target_group_arn   = aws_lb_target_group.webserver-tg.arn
}


resource "aws_autoscaling_policy" "scale-up" {
  name                   = "Simple Scaling Policy-scale-up"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.webserver-autosg.name
}

resource "aws_cloudwatch_metric_alarm" "scale-up-alarm_actions" {
  alarm_name          = "terraform-test-scale-up"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "60"

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.webserver-autosg.name
  }

  alarm_description = "This metric monitors scale-up cpu utilization"
  alarm_actions     = [aws_autoscaling_policy.scale-up.arn]
}





resource "aws_autoscaling_policy" "scale-down" {
  name                   = "Simple Scaling Policy-scale-down"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  policy_type            = "SimpleScaling"
  autoscaling_group_name = aws_autoscaling_group.webserver-autosg.name
}

resource "aws_cloudwatch_metric_alarm" "scale-down-alarm_actions" {
  alarm_name          = "terraform-test-scale-down"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "40"

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.webserver-autosg.name
  }

  alarm_description = "This metric monitors scale-down cpu utilization"
  alarm_actions     = [aws_autoscaling_policy.scale-down.arn]
}