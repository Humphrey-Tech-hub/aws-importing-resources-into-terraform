
resource "aws_iam_user" "user1" {
  name = "hpotter"
}

# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "hgranger"
resource "aws_iam_user" "user2" {
  force_destroy        = null
  name                 = "hgranger"
  path                 = "/"
  permissions_boundary = null
  tags = {
    CostCenter   = "Labs"
    Description  = "Existing IAM user for import block practice"
    Environment  = "LabAccount"
    LabScenario  = "terraform-import-resources"
    Lifetime     = "Temporary"
    Name         = "hgranger"
    Organization = "cybr"
    Owner        = "LabsTeam"
    Purpose      = "TerraformImport"
  }
  tags_all = {
    CostCenter   = "Labs"
    Description  = "Existing IAM user for import block practice"
    Environment  = "LabAccount"
    LabScenario  = "terraform-import-resources"
    Lifetime     = "Temporary"
    Name         = "hgranger"
    Organization = "cybr"
    Owner        = "LabsTeam"
    Purpose      = "TerraformImport"
  }
}
