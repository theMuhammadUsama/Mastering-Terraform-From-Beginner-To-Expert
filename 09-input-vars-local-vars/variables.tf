#  Variable for Task 1

# variable "aws_region" {
#   type        = string
#   description = "description"
# }

# Variables for task 2

variable "ec2_instance_type" {
  type        = string
  default     = "t2.micro"
  description = "The type of the managed ec2 instance"

  validation {
    condition     = contains(["t2.micro", "t3.micro"], var.ec2_instance_type)
    error_message = "Only supports t2.micro or t3.micro"
  }
}

# variable "ec2_volume_size" {
#   type        = number
#   description = "The size in GB of the root block attached to managed ec2 instance"
# }
# variable "ec2_volume_type" {
#   type        = string
#   description = "The volume type between gp2 and gp3"
# }

# VARIABLES FOR TASK 3

variable "ec2_volume_config" {
  type = object({
    size = number
    type = string
  })

  description = "The size and type of root block volume for our ec2 instances"

  default = {
    size = 10
    type = "gp3"
  }
}

variable "additional_tags" {
  type    = map(string)
  default = {}
}