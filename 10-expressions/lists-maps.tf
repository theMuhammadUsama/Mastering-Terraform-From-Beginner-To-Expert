# Task 3: Using for loop to transform list into map and vice versa 
locals {
    users_map = { 
        for user_info in var.users : user_info.username => user_info.role 
        }
    
    usernames_from_map = [ for username, role in local.users_map: username]
}

output "users_map" {
    value = local.users_map
}

output "usernames_from_map" {
    value = local.usernames_from_map
}