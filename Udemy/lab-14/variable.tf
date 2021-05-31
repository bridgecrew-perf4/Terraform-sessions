variable "region" {
    type = string
    default = "us-east-1"
}

variable "port_list" {
    type = list
    default = ["80", "443"]
}

variable "instance_type" {
    type = string
    default = "t2.micro"
}

variable "tags" {
    type = map
    default = {
        Owner = "Solongo"
        env = "dev"
        Project = "Udemy"
    }
}
