variable "env" {      #env is local name
  default     = "task-4" #dev is default value
  type        = string # string is exicting so it does not need ""
  description = "Name of the enivorment"
}


variable "vpc_cidr_block" {
  type = string
}

variable "instance_type" {     
  default     = "t2.micro" 
  type        = string # string is exicting so it does not need ""
  description = "type of instance"
}

variable "cidr_block" {
    type = string
    description = "this is route table  cidr_block"
}

variable "cidr_block_public_subnet1" {
type = string
description = "This is public subnet cidr"
}

variable "cidr_block_public_subnet2" {
type = string
description = "This is public subnet cidr"
}

variable "cidr_block_public_subnet3" {
type = string
description = "This is public subnet cidr"
}

variable "cidr_block_private_subnet1" {
type = string
description = "This is public subnet cidr"
}

variable "cidr_block_private_subnet2" {
type = string
description = "This is public subnet cidr"
}

variable "cidr_block_private_subnet3" {
type = string
description = "This is public subnet cidr"
}

variable "public-subnet-1" {
  type = string
  description = "This is pub-subnet-1"
}

variable "public-subnet-2" {
  type = string
  description = "This is pub-subnet-2"
}

variable "public-subnet-3" {
  type = string
  description = "This is pub-subnet-3"
}
variable "private-subnet-1" {
  type = string
  description = "This is pri-subnet-1"
}

variable "private-subnet-2" {
  type = string
  description = "This is pri-subnet-2"
}

variable "private-subnet-3" {
  type = string
  description = "This is pri-subnet-3"
}