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

