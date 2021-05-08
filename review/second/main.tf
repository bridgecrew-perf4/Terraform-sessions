resource "aws_s3_bucket_object" "object" {
  bucket = data.terraform_remote_state.s3.outputs.s3_bucket_id
  key    = "test-key.txt"
  source = "text.txt"
}

# object is saperate recource then s3 bucket.