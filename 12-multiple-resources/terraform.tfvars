# Task 2: Value of count variable
# ec2_instance_count = 0

# Task 3: Value of list variables
# ec2_instance_config_list = [
  # {
  # instance_type = "t2.micro"
  # ami           = "ubuntu"
  # },
  # {
  #   instance_type = "t2.micro" # Task 4: Step 3
  #   ami           = "nginx"
  # }
# ]

# Task 5 step 2
ec2_instance_config_map = {
  ubuntu_1 = {
    instance_type = "t2.micro"
    ami           = "ubuntu"
  }
  nginx_1 = {
    instance_type = "t2.micro"
    ami           = "nginx"
    subnet_name  = "subnet_1"
  }
}

# Task 7 step 1
subnet_config = {
  default = {
    cidr_block = "10.0.0.0/24"
  }
  subnet_1 = {
    cidr_block = "10.0.1.0/24"
  }
}