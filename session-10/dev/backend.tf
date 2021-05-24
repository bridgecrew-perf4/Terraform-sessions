terraform {
  backend "s3" {
    bucket = "terraforms3-bucket-solongo"
    key    = "session-10/dev/main.tfstate"
    region = "us-east-1"

  }
}