terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.30.0"
    }
  }

  # to manage remote state in s3
  backend "s3" {
    bucket = "my-unique-remote-terraform-state-bucket-5559-ad"
    key    = "terraform.tfstate"
    region = "ap-south-1"
    # state locking with dynamodb
    dynamodb_table = "state-lock-table-5559-ad"
  }
}

provider "aws" {
  region = "ap-south-1"
}