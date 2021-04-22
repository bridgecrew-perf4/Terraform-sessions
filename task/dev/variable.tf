variable  "vpc_cidr_block" {
    type = string
    description = "This is vpc_cidr_block"
}

variable  "env" {
    type = string
    description = "This is env"
}
variable "project_name" {
    type = string
    description = "this is a project name"
}

variable "instance_name" {
    type = string
    description = "instance name"
}

variable "cidr_block" {
    type = string
    description = "this is route table  cidr_block"
}

variable "cidr_block_public_subnet1" {
    type = string
    description = "this is public subnet -1 cidr_block"
}

variable "cidr_block_public_subnet2" {
    type = string
    description = "this is public subnet -2 cidr_block"
}

variable "cidr_block_public_subnet3" {
    type = string
    description = "this is public subnet -3 cidr_block"
}

variable "cidr_block_private_subnet1" {
    type = string
    description = "This is private 1 cidr_block"
}        


variable "cidr_block_private_subnet2" {
    type = string
    description = "This is private 2 cidr_block"
}        

variable "cidr_block_private_subnet3" {
    type = string
    description = "This is private 3 cidr_block"
}        

variable "instance_type" {
    type = string
    default = "t2.micro"
    description = "This is instance type for wordpress-web"
}

variable "web-ingress" {
    type = number
    description = "This is web port"
}

variable "ssh-ingress" {
    type = number
    description = "This is ssh port"
}

variable "protocol" {
    type = string
    description = "This is ingress protocol"
}

variable "egress-all" {
    type = number
    description = "This is egress port"
}



variable "egress-protocol" {
    type = number
    description = "This is egress protocol -1"
}

variable "mysql-ingress" {
    type = number
    description = "mysql ingress port"
}

variable "database-sg" {
    type = string
    description = "database sg"
}

variable "database-instance_name" {
    type = string
    description = "database instance name"
}

variable "wordpress-sg" {
    type = string
    description = "wordpress sg"
}