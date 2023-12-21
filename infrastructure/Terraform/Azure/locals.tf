locals {
  application_name = "clubhouse"
  region           = "East US"
  tags = {
    ops_managed_by       = "terraform",
    ops_source_repo      = "ClubhouseApi"
    ops_source_repo_path = "infrastructure/Terraform/AWS"
  }
}