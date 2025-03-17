**Task 1: Creating Multiple Subnets with the count Argument**
1. Create a Virtual Private Cloud (VPC) with a CIDR block set to 10.0.0.0/16. The VPC is tagged with the Project and Name tags that hold the value of a newly created local.project local variable.
2. Leverage the count meta-argument to create multiple subnets, reducing code duplication and making extension easier.
3. Assign unique names to the subnets using the count.index value and the tags attribute.
4. Create a new variable subnet_count to replace the hard-coded count value in the aws_subnet resource, thereby making the count of subnets configurable.
