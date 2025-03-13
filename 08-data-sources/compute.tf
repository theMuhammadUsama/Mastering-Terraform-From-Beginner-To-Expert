# data source to fetch info about Ubuntu AMI 
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# data source to fetch info about current user
data "aws_caller_identity" "current" {}

# data source to fetch info about current region
data "aws_region" "current" {}

# data source to fetch info about VPC
data "aws_vpc" "prod_vpc" {
  tags = {
    Env = "Prod"
  }
}

# data source to fetch list of availability zones
data "aws_availability_zones" "available" {
  state = "available"
}

# data source to fetching a IAM policy
data "aws_iam_policy_document" "static_website" {
  statement {
    sid = "PublicReadGetObject"

    principals {
      type        = "*"
      identifiers = ["*"]
    }
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.public_read_bucket.arn}/*"]
  }
}

resource "aws_s3_bucket" "public_read_bucket" {
  bucket = "my_read_public_bucket"
}

# showing output of Ubuntu AMI 
output "ubuntu_ami_data" {
  value = data.aws_ami.ubuntu.id
}

# showing output of current user
output "aws_caller_identity" {
  value = data.aws_caller_identity.current
}

# showing output of current region
output "aws_region" {
  value = data.aws_region.current
}

# showing output of VPC id
output "aws_vpc" {
  value = data.aws_vpc.prod_vpc.id
}

# showing output list of availability zones in current region
output "azs" {
  value = data.aws_availability_zones.available.names
}

# showing output of IAM policy 
output "iam_policy" {
  value = data.aws_iam_policy_document.static_website.id
}
resource "aws_instance" "ec2" {
  # Ubuntu AMI ID = ami-0c1907b6d738188e5
  # NGINX AMI ID = ami-015c805cace6e65db
  ami                         = data.aws_ami.ubuntu.id
  associate_public_ip_address = true
  instance_type               = "t2.micro"

  root_block_device {
    delete_on_termination = true
    volume_size           = 10
    volume_type           = "gp3"
  }
}