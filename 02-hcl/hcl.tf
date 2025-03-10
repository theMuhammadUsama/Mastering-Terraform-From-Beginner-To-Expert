terraform {
    required_providers{
        aws = {
            source = "hashicorp/aws"
            version = "~> 5.0"
        }
    }
}

#Activetly managed by us, Managed by our Terraform Project
resource "aws_s3_bucket" "my_bucket" {
    bucket = var.bucket_name
}

#Managed somewhere else, we just want to use it in our project
data "aws_s3_bucket" "my_external_bucket" {
    bucket = ""
}

variable "bucket_name" {
  type        = string
  default     = "my_default_bucket_name"
  description = "This variable is used to set the bucket name"
}

output "bucket_id" {
    value = aws_s3_bucket.my_bucket.id
}

locals {
  local_example = "This is a local varaible/value"
}

