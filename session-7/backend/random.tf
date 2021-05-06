resource "random_password" "rds-password" {
length = 20
special = true
override_special = "$@" # Terraform generate the password
}