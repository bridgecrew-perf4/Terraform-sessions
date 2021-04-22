resource "aws_instance" "homework-task" {
ami          = "ami-0686851c4e7b1a8e1"
instance_type = "t2.micro"
key_name = "Mackey-Public key"

user_data = <<EOF
          #!/bin/bash
          sudo yum update -y
          sudo yum install -y httpd 
          sudo systemctl start httpd
          sudo systemctl enable httpd
          echo "Hello from Instance 1" > /var/www/html/index.html
  EOF
tags = {
    Name = "homework_task"
  }
}
