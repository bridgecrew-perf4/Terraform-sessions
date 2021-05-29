provider "aws" {
    region = "us-east-1"
}

resource "aws_db_instance" "rds" {
  identifier = "dev-mysql-rds"
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  name                 = "mydb"
  username             = "admin"
  password             = random_password.main.result
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
}

######## Generate password ############
resource "random_password" "main" {
    length = 20
    special = true
    override_special = "$%!"
}

############ Store Password in ssm #############
resource "aws_ssm_parameter" "rds_password" {
    name = "/prod/prod-mysql-rds/password"
    type = "SecureString"
    value = random_password.main.result
}

############### Retrive Password ##############
data "aws_ssm_parameter" "rds_password" {
name = "/prod/prod-mysql-rds/password"
depends_on = [aws_ssm_parameter.rds_password]
}

output "rds_address" {
    value = aws_db_instance.rds.address
}

output "rds_port" {
value = aws_db_instance.rds.port
}

output "rds_username" {
    value = aws_db_instance.rds.username
}

output "rds_dbname" {
    value = aws_db_instance.rds.name
}