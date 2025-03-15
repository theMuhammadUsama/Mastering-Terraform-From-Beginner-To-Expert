# Task 6 using locals value
resource "random_id" "project_bucket_suffix" {
    byte_length = 4
}
resource "aws_s3_bucket" "project_bucket" {
    bucket = "${local.project_name}-${random_id.project_bucket_suffix.hex}"
}