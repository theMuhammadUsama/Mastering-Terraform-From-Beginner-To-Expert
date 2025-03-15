# Task 6 working with locals
locals {
  project_owner = "terraform_course"
  cost_center   = "1234"
  managed_by    = "Terraform"
  project_name = "09-input-vars-local-vars"
}

locals {
  common_tags = {
    project_owner = local.project_owner
    cost_center   = local.cost_center
    managed_by    = local.managed_by
  }
}