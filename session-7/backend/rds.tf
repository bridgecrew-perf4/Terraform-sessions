resource "aws_db_instance" "rds" {
  allocated_storage    = 10 
  storage_type         = "gp2" # general purpose
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro" 
  name                 = "wordpress" 
  username             = "admin" # Hard code is better
  password             = random_password.rds-password.result #Becasue TER will generate password.
  identifier           = "${var.env}-instance"
  vpc_security_group_ids = [aws_security_group.rds-sg.id]
  publicly_accessible    = var.env == "dev" ? true : false #== Equality Operators, var.env(dev) = "dev" Conditional Expressions, true:false =Bools
  # Combinations of all these 3 things. var.env = dev dev==dev true. var.env=prod prod==dev false
  skip_final_snapshot  = true # If QA,Pro env it's false. Dev=true. If it's true blow identifier needed.
  final_snapshot_identifier = var.snapshot ==true ? null : "${var.env}-snapshot"
}

resource "aws_security_group" "rds-sg" {
  name        = "${var.env}-rds-sg"
  description = "Allow MySQL"
# VPC in here if you use not Default VPC. 
}

resource "aws_security_group_rule" "rds-ingress" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.rds-sg.id
}


resource "aws_security_group_rule" "webserver_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.rds-sg.id
}