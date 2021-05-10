terraform {
  backend "s3" {
    bucket = "terraforms3-bucket-solongo"
    key    = "session-8/rds.tfstate"
    region = "us-east-1"

  }
}
# Backend.tf files keeps the state file in the remote location in s3 bucket. Team can collibratre this way. 