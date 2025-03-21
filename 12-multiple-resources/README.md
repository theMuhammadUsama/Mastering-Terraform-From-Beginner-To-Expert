**Task 1: Creating Multiple Subnets with the count Argument**
1. Create a Virtual Private Cloud (VPC) with a CIDR block set to 10.0.0.0/16. The VPC is tagged with the Project and Name tags that hold the value of a newly created local.project local variable.
2. Leverage the count meta-argument to create multiple subnets, reducing code duplication and making extension easier.
3. Assign unique names to the subnets using the count.index value and the tags attribute.
4. Create a new variable subnet_count to replace the hard-coded count value in the aws_subnet resource, thereby making the count of subnets configurable.

**Task 2: Referencing Resource with count Argument**
1. Create a new variable, ec2_instance_count, of type number and with a default value of 1.
2. Create a data source that reads an Ubuntu AWS AMI.
3. Create an aws_instance resource that uses the ec2_instance_count variable to create multiple EC2 instances.
4. Distribute the EC2 instances equally across all the subnets we have created in the previous exercise.

**Task 3: Creating EC2 Instances based on a List Variable**
1. Create a list of EC2 instances based on a specified configuration list variable.
2. The configuration list includes details such as the instance type and AMI.
3. The AMI property should receive a user-friendly value, such as "ubuntu", and retrieve the AMI ID based on a data source.
4. The instances are distributed across different subnets.

**Task 4: Extending the AMIs to also Allow NGINX**
1. Define a data source to fetch the AMI ID for the NGINX Bitnami AMI.
2. Extend the ami_ids local to include an entry for NGINX.
3. Add another object in the ec2_instance_config_list to deploy an instance with the NGINX image.

**Task 5: Adding Validation to the List Variable**
1. If not already done so, define a variable ec2_instance_config_list.
    - This variable is a list of objects.
    - Each object contains instance_type and ami.
2. Add validation to ensure that only t2.micro instances are used.
3. Add another validation to ensure that only ubuntu and nginx images are allowed.

**Task 5: Creating EC2 instances based on a Map Variable**
1. Create a Terraform variable named ec2_instance_config_map, which holds the configuration for the EC2 instances. This map object includes instance_type and ami as keys, both of which are strings.
2. Add suitable entries to the ec2_instance_config_map variable in the terraform.tfvars file. For example, one entry could be for a ubuntu_1 instance with t2.micro as the instance_type and ubuntu as the ami.
3. Create EC2 instances based on the ec2_instance_config_map variable using a for_each loop. This loop iterates over each item in the ec2_instance_config_map and creates an EC2 instance with the provided configuration.

**Task 6: Adding Validation to the Map Varaible**
1. If not already done so, define a variable ec2_instance_config_map.
    - This variable is a map of objects.
    - Each object contains instance_type and ami.
2. Add validation to ensure that only t2.micro instances are used.
3. Add another validation to ensure that only ubuntu and nginx images are used.

**Task 7: Passing Subnet Information in the Configuration**
1. Create a map variable for the subnet configuration, where each entry receives a CIDR block.
2. Add a validation rule to ensure that all provided CIDR blocks are valid.
3. Create a resource block for the AWS subnet, which creates a subnet for each item in the subnet configuration map.
4. Extend the existing EC2 instance configuration variables by adding a new property that receives the subnet in which to deploy the instance.
