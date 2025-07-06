I hope the names of the files and folders are self explanatory.

I created the project under the folder assignment, a github workflow for the deployment of the project and this README file.
The workflow was tested successfully and respective infrastructure pieces were created on my AWS account.

The project consists of
main.tf //declaration of the moduleas along with fundamental attributes
providers.tf // declaration of aws provider
variables.tf // declaration of aws region
Under modules folder:
vpc/main.tf // aws attributes, security groups, ingress and egress flows permitted
vpc/outputs.tf // variables for vpc, subnet, security group
vpc/variables.tf // naming of variables
vpc/security_group.tf // security group declaration 
mongo/main.tf // 3 instances as mongodb nodes
mongo/outputs.tf 
mongo/variables.tf
mongo/security_group.tf // in 27017
elk/main.tf // one instance for the installation of elk
elk/outputs.tf
elk/variables.tf
elk/security_group.tf //in 5601,5044,9200
postgresql/main.tf //one master node and one slave node
postgresql/outputs.tf
postgresql/variables.tf
postgresql/security_group.tf // in 5432

For the creation, configuration and debuggin of the above ai tool copilot was utilised.
All decisions were made having as target to deliver a functional part of the assignment and not commercial use nor best practices.

