## Terraform-multi-environment-infrastructure
This project demonstrates the deployment of infrastructure to multiple enviroments (dev, staging and prod) in AWS with Terraform. It further demonstrates the use of reusable modules to allow consistent deployment across the various environments. The modules are networking, compute and database, they are reusable building blocks that contain the actual resources definition. The environments on the other hand, are the specific deployments that use the buildling blocks.

### The project meets the following technical requirements
* Networking module: VPC, public/private subnets, IGW, NAT Gateway, route tables
* Compute module: EC2 instances or ASG with launch template, security groups
* Database module: RDS instance in private subnet with security group

### Project tree
The diagram below shows the various files and directories in the project. Each of the modules contains 3 Terraform configuration files while the environments contain 4 Terraform configuration files as shown.

An S3 bucket (terraform-state456789) with native lock enabled was deployed in AWS to store the terraform state remotely allowing the tracking of changes in the infrastructure it manages while the lock prevents multiple Terraform operations from modifying the same state concurrently. Also, a user terraform-service with appropriate permission was provisioned to allow the creation of the storage account through AWS CLI and also for the succesful running of 'Terraform plan'

### Results
Having completed the writting of the necessary terrraform files for the environments and modules. From each of the environments the commands 'terraform init', 'terraform validate' and 'terraform plan' were ran succesfully, indicating the proper configuration in place.

For the dev environment


For the staging environment


For the prod environment

### Conclusion

This project succesfully demonstrates how Terraform could be used to build reusable, scalable, and consistently managed AWS infrastructure across separate development, staging, and production environments. It also demonstrates practical use of Terraform modules, remote state management, state locking, validation, and infrastructure-as-code principles to improve reliability and maintainability.
