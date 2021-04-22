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


data "template_file" "user_data" { # making template file means i make this script part of my Ter file
  template = file("user.data.sh")
  vars = {
    environment = var.env # making specific enivorment from variable file
  }
}