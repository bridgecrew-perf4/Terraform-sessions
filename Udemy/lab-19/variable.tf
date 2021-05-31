// variable "tags" {
//     type = map {
//         Name = "lab19_ec2"
//         env = "dev"
//         Projecr = "Udemy"
//     }
// }
// variable "volume_tags" {
//     Name = "ebs-volume"
//     env = "dev"
// }

variable "env" {
    default = "dev"
}

variable "server_size" {
    default = {
        prod = "t2.micro"
        dev = "t2.nano"
    }
}

variable "ami" {
    default = {
     "us-east-1" = "ami-0d5eff06f840b45e9"
     "us-west-1" = "ami-04468e03c37242e1e"
    }
}

variable "allow_port" {
    default = {
        prod = ["80", "443"]
        my_default = ["80", "443", "22"]
    }
}

variable "region" {
    default = {
        prod = ["us-east-1"]
        dev = ["us-west-1"]
}
}