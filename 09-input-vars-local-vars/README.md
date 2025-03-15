**Task 1: Receiving the AWS Region via Variables**
1. [Done] Create a variables.tf file with a single variable named aws_region.
2. [Done] Create a provider.tf file with the standard configuration code we have been using so far (Terraform required version and the AWS provider requirements).
3. [Done] Use the aws_region variable to set the region for configuring the aws provider.
4. [Done] Create an EC2 instance using the aws_ami data source for the Ubuntu AWS AMI.
5. NOTE: By using input variable for region if we apply our changes in multiple regions then state of resource from one region might be lost.

**Task 2: Customizing EC2 Instance Size and Volume Data**
1. [Done] Create a variable named ec2_instance_type that specifies the type of the EC2 instance. This variable should be of type string and default to t2.micro.
2. [Done] Add validation to the instance type variable to ensure that the instance type is either t2.micro or t3.micro. If a different value is used, Terraform should return an error message stating that “Only t2.micro and t3.micro instances are supported”.
3. [Done] Create two additional variables to receive both the EC2 volume type and volume size. These variables should have the correct types, sensible defaults, and relevant descriptions.
4. [Done] Create an EC2 instance that leverages the variables we have created. This instance should retrieve the AMI ID via a data source and use the previously defined variables for the instance type and the root block device settings.

**Task 3: Using Objects for Volume Configuration**
1. [Done] Create a variable ec2_volume_config, which contains the volume type and volume type of the root block device for the EC2 instance.
2. [Done] Create a variable additional_tags, which allows the user to define additional tags to the EC2 instance.
3. [Done] Update the EC2 instance configuration to leverage the new variables.

**Task 4: Working with tfvars**
1. Create a terraform.tfvars file that contains configurations suitable for our defined variables.
2. Rename the file to dev.terraform.tfvars, and check what happens when running Terraform commands.
3. Create a new prod.terraform.tfvars file with different variable values should be created. We should be able to test loading this file into the Terraform plan and apply commands. We can specify variables file using -var-file=file.tfvars argument in command.

**Task 5: Working with auto.tfvars**
1. First, create a new file called prod.auto.tfvars. This file will contain specific configurations that you want to apply when running Terraform in the production environment. Make sure that you also have a terraform.tfvars file with some default configuration.
2. Inside prod.auto.tfvars, set the ec2_instance_type to t3.large. This setting specifies the type of EC2 instance that Terraform will deploy.
3. Finally, add the additional_tags block. This block allows you to add additional tags to your resources. The ValuesFrom tag is set to prod.auto.tfvars, indicating that the values are taken from the prod.auto.tfvars file.
4. Save the prod.auto.tfvars file and run the terraform plan command. Which values are taken by Terraform? 
5. The *.auto.tfvars files are automatically loaded by Terraform when it runs. The values in the *.auto.tfvars files override the values in the terraform.tfvars file. This means that if you have the same variable defined in both the terraform.tfvars file and an *.auto.tfvars file, the value from the *.auto.tfvars file will be used.
6. Delete the prod.auto.tfvars to prevent Terraform from automatically loading values from it in later plan and apply commands.

NOTE: The name of environment variable for terraform always start with TF_VAR like 'export TF_VAR_ec2_instance_type=t2.micro'. And to specify the value of variable using cli we can use -var argument like this: 'terraform plan -var=ec2_instance_type=t3.large'

**Task 6: Working with Locals**
1. Define the following locals with sensible values: project, project_owner, cost_center, and managed_by.
2. Create a common_tags local object, which references some of the previous locals to create an object.
3. Refactor our EC2 instance to merge local.common_tags and var.additional_tags when setting its tags.
4. Deploy an S3 resource that also uses values from our locals in its configuration.
5. Move the locals block to its own file named shared-locals.tf.


