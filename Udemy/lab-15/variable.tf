variable "region" {
    type = string
}

variable "port_list" {
    type = list
}

variable "instance_type" {
    type = string
    
}

variable "tags" {
    type = map
    default = {
        Owner = "Solongo"
        env = "dev"
        Project = "Udemy"
    }
}
