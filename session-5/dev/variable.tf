variable "env" {      #env is local name
  default     = "dev" #dev is default value
  type        = string
  description = "Name of the enivorment"
}


variable "instance_type" {
  type        = string
  description = "this is for instance type"
}




variable "web_sg_tcp_ports" {
  type = list(string)
}

variable "web_sg_tcp_ports_cidr" {
  type = list (string)
}