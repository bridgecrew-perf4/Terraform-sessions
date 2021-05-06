resource "aws_lb" "webserver-alb" {
  name               = "${var.env}-webserver-alb"
  internal           = false # Not make varible for false and true. external lb. traffic coming from outside so this is external lb.
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb-sg.id]
 
  subnets            = data.aws_subnet_ids.default.ids
}

resource "aws_lb_listener" "webserver-listerner" { # Listerner is connects Load balancer to Target Group
  load_balancer_arn = aws_lb.webserver-alb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward" # Different types
    target_group_arn = aws_lb_target_group.webserver-tg.arn # Here is connection LB and Target Group.
  }
}

resource "aws_security_group" "alb-sg" { #Load balance needs a SECURITY GROUP.
  name        = "${var.env}-alb-sg"
  description = "Allow HTTP traffic"
  # VPC in here if you use not Default VPC. 
}

resource "aws_security_group_rule" "http_ingress" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.alb-sg.id
}


resource "aws_security_group_rule" "alb-egress" {
  type              = "egress"
  from_port         = "80"
  to_port           = "80"
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.alb-sg.id
}