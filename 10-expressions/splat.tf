# Splat expression only works with lists to use it with objects we can use for loop with splat
locals {
  firstnames_from_splat = var.objects_list[*].firstname 
}

output "firstnames_from_splat" {
  value       = local.firstnames_from_splat
}
