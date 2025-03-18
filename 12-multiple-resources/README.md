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

**Task 3: **
1. Create a list of EC2 instances based on a specified configuration list variable.
2. The configuration list includes details such as the instance type and AMI.
3. The AMI property should receive a user-friendly value, such as "ubuntu", and retrieve the AMI ID based on a data source.
4. The instances are distributed across different subnets.
