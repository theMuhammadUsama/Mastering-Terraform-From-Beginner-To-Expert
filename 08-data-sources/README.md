**Task 1**
1. [Done] Define an AWS data source to retrieve the most recent Ubuntu AMI.
2. [Done] Create an output to print the ID of the retrieved AMI.
3. [Done] Create an AWS EC2 instance, using the retrieved Ubuntu AMI ID. Use an instance type that is included in your free tier. Most of the times, this will be a t2.micro instance, but it can also be t3.micro in regions that do not have t2.micro instances available. Make sure to check that beforehand to avoid any unwanted charges!
4. [Done] Configure the instance's root block device with a volume size of 10, a volume type of gp3, and set it to be deleted on termination.

**Task 2**
1. [Done] AWS Caller Identity Data Source: This data source should be defined to return the identity of the caller.
2. [Done] AWS Region Data Source: This data source should be defined to get the current AWS region.
3. [Done] AWS Caller Identity Output: This output should return the identity of the caller.
4. [Done] AWS Region Output: This output should return the current AWS region.

**Task 3**
1. [Done] Manually create a Virtual Private Cloud (VPC) in the AWS console with the following configuration:
    - Name: console-managed
    - Environment (Env) tag: Prod
    - CIDR Block: 10.0.0.0/16
2. [Done] Fetch the VPC information based on the Env tag via a aws_vpc data source block that specifies the correct filter criteria.
3. [Done] Define an output to display the id of the retrieved VPC.

**Task 4**
1. Create an IAM policy document using the aws_iam_policy_document data source. The policy should apply to all users and give read access to all objects in S3 buckets.
2. Output the policy document in JSON format for use elsewhere in the code.


