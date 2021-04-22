resource "aws_key_pair" "task-key" {
  key_name   = "Terraform-Server-Key"
  public_key =file("~/.ssh/id_rsa.pub")

 tags = {
    Name = "${var.env}-Terraform-Server-Key"
    Project = var.project_name
    Environment = var.env
 }
}


