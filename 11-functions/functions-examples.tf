locals {
  name = "Muhammad Usama"
  age  = 24
  
  my_object = {
    key1 = 10
    key2 = "my_value"
  }
}

output "example1" {
  value = {
    uppercase = upper(local.name)
    combined = startswith(lower(local.name), "muhammad")
  }
}

output "example2" {
    value = pow(local.age, 2)
}

output "example3" {
    value = {
        file_read = file("${path.module}/users.yaml") 
        objects_from_file = yamldecode(file("${path.module}/users.yaml")).users[0]
    }
}

output "example4" {
    value = yamlencode(local.my_object)
}