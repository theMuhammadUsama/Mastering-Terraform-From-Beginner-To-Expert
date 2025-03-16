# Task 1: Specifying type of lists
variable "numbers_list" {
  type        = list(number)
  description = "description"
}

variable "objects_list" {
  type = list(object({
    firstname = string
    lastname  = string
  }))
}

# Task 2: Specifying type to map
variable "numbers_map" {
  type = map(number)
}

# Task 3: Specifying type to list
variable "users" {
  type = list(object({
    username = string
    role     = string
  }))
}