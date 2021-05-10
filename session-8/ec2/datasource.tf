data "aws_ami" "amazon_linux_2" { # it will pulling amazon_linux2 image
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0*"] # hvm - hardware virtual machine
  }

  filter { # Filtering means specific 
    name   = "architecture"
    values = ["x86_64"]
  }
}
