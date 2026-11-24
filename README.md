# Import AWS resources into Terraform

# Objectives
  1. Import an existing IAM user with Terraform CLI
  2. Generate resource configuration with an import block
  3. Compare the imported state with your resource configuration
  4. Remove imported users with Terraform


Configure your AWS CLI Terminal

aws configure --profile <profile-name>

Provide the Access Key and Secret
Configure your Region where your AWS resources would be deployed
Configure your output format either to none or my favorite json


List IAM user

aws iam list-users --profile <profile-name>

Prepare your resource blocks : provider.tf, main.tf and Variables.tf
Refer for syntax from _https://registry.terraform.io/namespaces/hashicorp for the 32 providers, in our case its aws
In my Variable.tf file i defined my region and profile


Format your terraform files

terraform fmt

Initialize directory

terraform init

# Options to import users into Terraform
    # Option 1
      # Refer to Terraform documentation https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user#import
      # Using Teraform import, import IAM Users using name
        terraform import aws_iam_user.<Resource_id> <name-of -user>

        # Requires you to know the name attribute of the terraform resource aws_iam_user
        # can retrieve by viewing user attributes
        aws iam get-user --user-name <name-of-user> --profile <profile-name>

        # The terraform import command import the resource attributes into Terraform state
        # Viewing Terraform state
        terraform state show aws_iam_user.<resource_id>

        # Above command would return, username, ARN value and tags in the import state.

        # create an execution plan, create a name attribute first in your main.tf file
        terraform plan

        # Option 2
        # Using Terraform import block used to import resources including all its properties directly into a configuration file without writing code
        # create imports.tf
            import {
                to = aws_iam_user.<rosource-id>
                id = "<user-name>"
            }

          terraform plan --generate-config-out=generate_config.tf

          # Copy content of generate_config.tf to main.tf
          # Remove generate_confi.tf
          rm generate_config.tf
          terraform plan

          # Import resources into state
          terraform apply

          # Alternative to Option 2
          # Instead of creating the import.tf or generating the generate_config.tf files.
          # You can add the import.tf content into main.tf
          main.tf
          import {
          to = aws_iam_user.<id>
          id = "<user-name>"
          }

          resource "aws_iam_user" "<id>" {
          name = "<user-name>"
          }

          terraform apply

          # Clean up
          terraform destroy
        
      
