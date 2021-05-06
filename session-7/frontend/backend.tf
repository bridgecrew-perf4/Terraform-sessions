terraform {
  backend "s3" {
    bucket = "terraforms3-bucket-solongo"
    key    = "session-6/frontend.tfstate"
    region = "us-east-1"

  }
}