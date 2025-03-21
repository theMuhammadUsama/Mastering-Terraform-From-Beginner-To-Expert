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

# Task 4: Define a data source to fetch the AMI ID for the NGINX Bitnami AMI.
data "aws_ami" "nginx" {
  most_recent = true
  owners      = ["679593333241"]

  filter {
    name   = "name"
    values = ["bitnami-nginx-1.27.4-r07-linux-debian-12-x86_64-hvm-ebs-nami-f5774628-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# Task 5 Step 3 creating resources from map using for each
resource "aws_instance" "from_map" {
  # each.key holds the key of each key-value pair in map
  # each.value holds the value of each key-value pair in map
  for_each      = var.ec2_instance_config_map
  ami           = local.ami_ids[each.value.ami]
  instance_type = each.value.instance_type
  subnet_id     = aws_subnet.main[each.value.subnet_index].id
  tags = {
    Project = local.project
    Name    = "${local.name}-${each.key}"
  }
}


