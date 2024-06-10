terraform {
  required_version = ">=1.1.7"
  required_providers {
    aws = ">=4.14.0"
  }
  backend "s3" {
    bucket = "terraform-gi-production-state"
    key    = "medarcade/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {}
