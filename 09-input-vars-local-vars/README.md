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

