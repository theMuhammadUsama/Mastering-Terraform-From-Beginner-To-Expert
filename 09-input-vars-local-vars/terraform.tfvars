# Task 4 terraform configs
ec2_instance_type = "t2.micro"
ec2_volume_config = {
  size = 10
  type = "gp3"
}
additional_tags = {
  ValuesFrom = "terrafom.tfvars"
}

# Presedence (top to bottom = low to high)
# TF_VAR env variable
# terraform.tfvars
# prod.auto.tfvars
# -var and -var-file cli arguments, latest takes highest Presedence.