# Task 1: Using for loops with lists
locals {
  double_numbers = [for num in var.numbers_list : num * 2]
  even_numbers   = [for num in var.numbers_list : num if num % 2 == 0]
  firstname      = [for person in var.objects_list : person.firstname]
  fullname       = [for person in var.objects_list : "${person.firstname} ${person.lastname}"]
}

output "list" {
  value = {
    double     = local.double_numbers
    even       = local.even_numbers
    firstnames = local.firstname
    fullnames  = local.fullname
  }
}
