terraform {
  required_version = "~> 0.14.0" #What is difference between "~>"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.24.0"
    }
  }
}

