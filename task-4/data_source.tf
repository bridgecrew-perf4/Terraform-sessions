

// data "aws_subnet_ids" "task-subnet" {
//   vpc_id = data.aws_vpc.task4-vpc.id # fatching subnet ids using vpc ids
// }

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