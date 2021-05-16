module "ec2_module" {
    source = "../../modules/ec2"
    env = "dev"
    instance_type = "t2.micro"
    ami = "0d5eff06f840b45e9"
}
