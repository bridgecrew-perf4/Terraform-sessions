terraform {
  backend "s3" {
    bucket = "terraforms3-bucket-solongo"
    key    = "session-9/dev.tfstate"
    region = "us-east-1"

  }
}