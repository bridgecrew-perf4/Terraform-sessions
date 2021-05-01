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

