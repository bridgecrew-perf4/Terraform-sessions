#!/bin/bash
          sudo yum update -y
          sudo yum install -y httpd 
          sudo systemctl start httpd
          sudo systemctl enable httpd
          echo "Hello from ${environment} Instance " > /var/www/html/index.html