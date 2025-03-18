locals {
  project = "12-multiple-resources"
  name    = "12-multiple-resources"
}

locals {
    ami_ids = {
        ubuntu = data.aws_ami.ubuntu.id
    }
}