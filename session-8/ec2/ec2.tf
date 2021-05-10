resource "aws_instance" "web-server" {
  ami                    = data.aws_ami.amazon_linux_2.image_id # data source starts with "data"
  instance_type          = var.instance_type                    # variable
  key_name               = aws_key_pair.terraform-key.key_name  #resource reference
  vpc_security_group_ids = [aws_security_group.webserver-sg.id] #resource reference


  tags = local.common_tags

  provisioner "file" {         #sending file local to remote machine. # provisioner runns on top level
    source      = "index.html" # file we have in local machine
    destination = "/tmp/index.html"
    connection {
      type        = "ssh"
      user        = "ec2-user"
      host        = self.public_ip # only provisioner is inside of resource
      private_key = file("~/.ssh/id_rsa")
    }
  }

  provisioner "remote-exec" { # run the command on the remote machine
    inline = [
      "sudo yum install httpd -y",
      "sudo cp /tmp/index.html /var/www/html/index.html",
      "sudo systemctl enable httpd",
      "sudo systemctl start httpd",
      "sudo touch test.txt"
    ]
    connection {
      type        = "ssh"
      user        = "ec2-user"
      host        = self.public_ip # only provisioner is inside of resource
      private_key = file("~/.ssh/id_rsa")
    }
  }
}

resource "aws_key_pair" "terraform-key" {
  key_name   = "terraform_key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_security_group" "webserver-sg" {
  name        = "Web"
  description = "This sg is for a web"


  ingress {
    description = "port- http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Web-SG"
  }
}