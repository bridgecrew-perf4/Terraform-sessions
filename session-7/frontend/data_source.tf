data "aws_vpc" "default" {
 
    default = true # it saying this is default vpc
}

data "aws_subnet_ids" "default" {
  vpc_id = data.aws_vpc.default.id # fatching subnet ids using vpc ids
}

data "aws_ami" "amazon_linux2" {
    most_recent = true
    owners = ["amazon"]

    filter {
        name = "name"
        values = ["amzn2-ami-hvm-2.0*"]
    }
filter {                          # Filtering means specific 
    name   = "architecture"
    values = ["x86_64"]
  }
}

data "template_file" "webserver" {
      template = file("userdata.sh")
      vars = {
          env = var.env
      }

}

data "terraform_remote_state" "rds" {
    backend = "s3"
    config = {
        bucket = "terraforms3-bucket-solongo"
        key = "session-7/backend.tfstate"
        region = "us-east-1"
    }
}

