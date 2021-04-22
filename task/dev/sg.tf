resource "aws_security_group" "web" {
  name        = "wordpress-web"
  description = "Allow inbound traffic for web"
  vpc_id      = aws_vpc.task-vpc.id

ingress {
    description = "ssh"
    from_port   = var.ssh-ingress
    to_port     = var.ssh-ingress
    protocol    = var.protocol
    cidr_blocks = [var.cidr_block]
  }

ingress {
    description = "web-port"
    from_port   = var.web-ingress
    to_port     = var.web-ingress
    protocol    = var.protocol
    cidr_blocks = [var.cidr_block]
  }

  egress {
    from_port   = var.egress-all
    to_port     = var.egress-all
    protocol    = var.egress-protocol
    cidr_blocks = [var.cidr_block]
  }

  tags = {
    Name = var.wordpress-sg
    Project = var.project_name
    Environment = var.env
   }

}
