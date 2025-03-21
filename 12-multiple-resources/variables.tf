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
    ami           = string
  }))

  # Task 5: Adding validation
  # Ensuring that t2.micro is used
  validation {
    condition = alltrue([
      for config in var.ec2_instance_config_list : contains(["t2.micro"], config.instance_type)
    ])
    error_message = "Only t2.micro instance type is allowed"
  }
  # Ensuring that only ubuntu or nginx ami is used
  validation {
    condition = alltrue([
      for config in var.ec2_instance_config_list : contains(["ubuntu", "nginx"], config.ami)
    ])
    error_message = "The provided \"ami\" type is invalid. Supports only ubuntu or nginx"
  }
}

# Task 5 Step 1 creating map
variable "ec2_instance_config_map" {
  type = map(object({
    instance_type = string
    ami           = string
    subnet_index  = optional(number, 0)
  }))

  # Task 6 Step 2 and 3 Adding Validation
  validation {
  condition = alltrue([
    for config in values(var.ec2_instance_config_map) : contains(["t2.micro"], config.instance_type)
  ])
  error_message = "Only t2.micro instance type is allowed"
  }

  validation {
    condition = alltrue([
      for config in values(var.ec2_instance_config_map): contains(["nginx", "ubuntu"], config.ami)
    ])
    error_message = "The provided \"ami\" type is invalid. Supports only ubuntu or nginx"
  }
}