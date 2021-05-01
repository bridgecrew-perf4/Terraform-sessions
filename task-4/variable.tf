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