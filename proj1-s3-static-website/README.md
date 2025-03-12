Steps for implementation:
1. [Done] Deploy an S3 bucket that will host the files for the static website.
2. [Done] Disable public access block so that others can access the bucket via the internet.
3. [Done] Create a policy that allows the s3:GetObject action for anyone and for all objects within the created bucket.
4. [Done] Create an S3 static website configuration, and link it to the existing bucket.
5. [Done] Create an index.html file and an error.html file containing some dummy text.
6. [Done] In a first moment, upload these files manually to the bucket via the AWS console. They should be placed in the root directory of the bucket. Later we will upload these files via Terraform
7. After testing that you can access the website via the internet, let's now update the files via Terraform.
    [Done] Delete the files from the S3 bucket.
    [Done] Use Terraform to create aws_s3_object resources and upload the files.
8. [Done] Create an output with the S3 Static Website endpoint.
9. [Done] Make sure to delete all the resources at the end of the project!
