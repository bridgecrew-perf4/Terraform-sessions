resource "aws_vpc" "task4-vpc" {
cidr_block = var.vpc_cidr_block
tags =  {
    Name = "${var.env}-vpc"

}
}