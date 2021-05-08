data "terraform_remote_state" "s3" {
    backend = "s3"
    config ={
        bucket = "terraforms3-bucket-solongo"
        key = "session-review/terraform.tfstate"
        region = "us-east-1"
    }
}

