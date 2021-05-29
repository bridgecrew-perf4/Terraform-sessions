output "sg_id" {
    value = aws_security_group.general.id
}

output "sg_tags" {
    value = aws_security_group.general.tags_all
}
output "sg_arn" {
    value = aws_security_group.general.arn
}

output "sg_owner_id" {
    value = aws_security_group.general.owner_id
}

output "web_public_ip" {
    value = aws_instance.web.public_ip
}

output "app_public_ip" {
    value = aws_instance.app.public_ip
}

output "db_public_ip" {
    value = aws_instance.db.public_ip
}

output "web_instance_state" {
    value = aws_instance.web.instance_state
}

output "availability_zone" {
    value = [
        aws_instance.web.availability_zone,
        aws_instance.app.availability_zone
    ]
}
