data "aws_availability_zones" "azs" {
    state = "available"
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.19.0"

  cidr = "10.1.0.0/16"
  name = "12-public-modules"
  azs = data.aws_availability_zones.azs.names
  public_subnets = ["10.1.1.0/24"]
  private_subnets = ["10.1.20.0/24"]
  
}

provider "aws" {
    region = "ap-southeast-1"
}
output "azs" {
    value = data.aws_availability_zones.azs.names
}