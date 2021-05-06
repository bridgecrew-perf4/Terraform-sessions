resource "aws_security_group" "webserver_sg" {
  name        = "${var.env}-webserver-sg"
  description = "Allow HTTP traffic"
  vpc_id = "aws_vpc.task4-vpc.id" # VPC in here if you use not Default VPC. 
}

resource "aws_security_group_rule" "http_from_lb" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.webserver_sg.id
}


resource "aws_security_group_rule" "webserver_egress" {
  type              = "egress"
  from_port         = "80"
  to_port           = "80"
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.webserver_sg.id
}