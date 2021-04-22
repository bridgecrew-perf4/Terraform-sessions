variable "env" {   #env is local name
    default = "dev" #dev is default value
    type = "string"
    description = "Name of the enivorment"
}


variable "instance_type" {
type = "string"
description = "this is for instance type"
}


variable "ami" {
    default = "ami-0742b4e673072066f"
    type = "string"
    description = "This ami is for us-east-1, ami is regional"
}

variable "key_name" {
    default = "Mackey-Public key"
    type = "string"
    description = "This is my mac public-key"
}

variable "region" {

type = "string"
description = "This is default region"
}