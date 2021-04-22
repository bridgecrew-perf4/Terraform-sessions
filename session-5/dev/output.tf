output "ec2_public_ip" {
  value = aws_instance.my_instance.public_ip
}

output "ec2_ami" {
  value = aws_instance.my_instance.ami
}

output "ec2_arn" {
  value = aws_instance.my_instance.arn
}

output "ec2_availability_zone" {
  value = aws_instance.my_instance.availability_zone
}

output "aws_key_pair" {
  value = aws_key_pair.first_key.key_name
}