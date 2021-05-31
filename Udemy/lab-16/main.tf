provider "aws" {
    region = var.region
}

resource "aws_instance" "test_instance" {
    ami = var.ami
    instance_type = var.instance_size
    // vpc_security_group_ids = [ data.aws_security_group.sg.ids]
    tags = merge(var.tags, { Name = "${var.tags["env"]} - test "})
}