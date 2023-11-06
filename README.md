### Creates Azure devops project using Terraform Cloud

Creates project
Creates Admin Team for the project
Assigns Admin permissions to Admin team

#### Confluence documentation
<https://confluence.standards.org.au/xxxx>

#### Dependencies

A few environment variables (`TF_CLOUD_ORGANIZATION), TF_API_TOKEN, AZDO_PERSONAL_ACCESS_TOKEN, AZDO_ORG_SERVICE_URL`) have been defined. Make sure the keys are not expired.

#### Steps

1. Update the terraform.tfvars file by adding the name of the project at the end  the file.
2. Create a pull request to develop branch. When the code is merged into develop branch, it will run a plan showing the resources that will be created.
3. Observe the output of the plan in github actions, and validate thats the outcome you want to achieve.
4. Create a pull request to main branch. Once the code is merged into the main branch, terrafom will create necessary projects and Teams.
5. Go to Azure Devops portal and validate all the resource creation are correct.
