variable "region" {
    type = string
    description = "This is region for test instance"
}

variable "ami" {
    type = string
    description = "This is Amazon instance"
}

variable "instance_size" {
    type = string
}
variable "tags" {
    type = map
    default = {
        Name = "test-ec2"
        Project = "Udemy"
        env = "dev"
    }
}