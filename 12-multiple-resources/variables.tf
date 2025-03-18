# Task 1: Creatin a variable with count value 2
variable "subnet_count" {
  type        = number
  default     = 2
  description = "Value of subnets to be created"
}
# Task 2: Creating a variable for ec2 instances with default value 1
variable "ec2_instance_count" {
  type    = number
  default = 1
}

# Task 3: Creating List of EC2 instance configs
variable "ec2_instance_config_list" {
  type = list(object({
    instance_type = string
    ami = string
  }))
}