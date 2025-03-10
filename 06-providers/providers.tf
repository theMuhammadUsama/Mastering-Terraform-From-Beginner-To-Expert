terraform {
  required_version = "~> 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

provider "aws" {
  region = "us-east-1"
  alias  = "us-east"
}

resource "aws_s3_bucket" "ap-southeast" {
  bucket = "some-random-bucket-atoz-name"
}

resource "aws_s3_bucket" "us-east" {
  bucket   = "some-random-bucket-atoz-next"
  provider = aws.us-east
}