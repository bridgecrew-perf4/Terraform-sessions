provider "aws" {
    region = "us-east-1"
}

data "aws_region" "current" {}
data "aws_caller_identity" "aws_acc" {}
data "aws_availability_zones" "current_az"{}

output "region_name" {
    value = data.aws_region.current.name
}
output "account_id" {
    value = data.aws_caller_identity.aws_acc.account_id
}
output "az" {
    value = data.aws_availability_zone.current_az.names
}
output "region" {
    value = data.aws_region.current.description
}