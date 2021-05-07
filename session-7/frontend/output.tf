output "alb_dns" {
    value = aws_lb.webserver-alb.dns_name
}

output "rds_db_name" {
    value = data.terraform_remote_state.rds.outputs.rds_db_name
}

output "rds_db_username" {
    value = data.terraform_remote_state.rds.outputs.rds_db_username
}

output "rds_db_password" {
    value = data.terraform_remote_state.rds.outputs.rds_db_password
}

output "rds_db_endpoint" {
    value = data.terraform_remote_state.rds.outputs.rds_db_endpoint
}

