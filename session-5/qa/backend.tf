terraform {
  backend "s3" {
    bucket = "terraforms3-bucket-solongo"
    key    = "qa/instance.tfstate" # key is path to the state file inside the bucket, Do not change key because of isolate enivorments. Instead create saperate folder 
    region = "us-east-1"
  }
}

