terraform {
  backend "s3" {
    bucket = "terraforms3-bucket-solongo"
    key    = "session-second/terraform.tfstate"
    region = "us-east-1"

  }
}