resource "aws_key_pair" "first_key" {
  key_name   = "terraform_key"
  public_key = file("~/.ssh/id_rsa.pub")
}