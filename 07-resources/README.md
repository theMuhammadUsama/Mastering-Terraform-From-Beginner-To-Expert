Steps for Implementation:
1. [Done] Deploy a VPC and a Subnet.
2. [Done] Deploy an Internet Gateway and associate it with VPC.
3. [Done] Setup a Route Table with a route to the IGW and associate it with the subnet.
4. [Done] Deploy an EC2 instance inside of created subnet and Associate a public IP address.
5. [Done] Associate a security group that allows public ingress.
6. [Done] Change the EC2 instance to use a publicly available NGINX AMI.
7. [Done] Destroy Everything