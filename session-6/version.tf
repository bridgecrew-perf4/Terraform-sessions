terraform {
  required_version = "~> 0.14.0" # ~> lazy constrain. 0 majer, 14 miner, 0 patching
  required_providers {
    aws = {
      source  = "hashicorp/aws" # under .ter file. Ter is Plugin based arch. Tool is more compatable than other tools. So Ter is flexable that other tools.
      version = "~> 3.35.0"
    }
  }
}