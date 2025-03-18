# Task 2: Data source to fetch the AMI of Ubuntu
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


# Task 2: Creating a resource for creating multiple ec2 instances using count
resource "aws_instance" "from_count" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  count         = var.ec2_instance_count
  subnet_id     = aws_subnet.main[count.index % length(aws_subnet.main)].id 
  # Using function to distribute ec2's in subnets

  tags = {
    Project = local.project
    Name    = "${local.name}-${count.index}"
  }
}

# Task 3: Creating a resource for creating multiple ec2 instances using list
resource "aws_instance" "from_list" {
  count         = length(var.ec2_instance_config_list)
  ami           = local.ami_ids[var.ec2_instance_config_list[count.index].ami]
  instance_type = var.ec2_instance_config_list[count.index].instance_type
  subnet_id     = aws_subnet.main[count.index % length(aws_subnet.main)].id # Using function to distribute ec2's in subnets

  tags = {
    Project = local.project
    Name    = "${local.name}-${count.index}"
  }
}