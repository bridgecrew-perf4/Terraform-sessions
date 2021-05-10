terraform {
  backend "s3" {
    bucket = "terraforms3-bucket-solongo"
    key    = "session-8/ec2.tfstate"
    region = "us-east-1"

  }
}