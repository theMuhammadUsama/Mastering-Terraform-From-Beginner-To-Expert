terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = " ~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
  backend "s3" {
    bucket = "my-state-bucket-tf99"
    key    = "05-backend/state.tfstate"
    region = "ap-southeast-1"
  }
}

provider "aws" {
  region = "ap-southeast-1"
}