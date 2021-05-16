terraform {
  backend "s3" {
    bucket = "terraforms3-bucket-solongo"
    key    = "session-9/qa.tfstate"
    region = "us-east-1"

  }
}