output "wordpress_public_ip" {
value = aws_instance.wordpress-web.public_ip
}
output  "wordpress_ami" {
    value = aws_instance.wordpress-web.ami
}