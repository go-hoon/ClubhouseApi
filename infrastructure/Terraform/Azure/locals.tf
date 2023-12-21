locals {
  application_name = "clubhouse"
  region           = "East US"

  node_count           = 1
  vm_size              = "Standard_B2s"
  linux_admin_username = "adminuser"

  tags = {
    ops_managed_by       = "terraform",
    ops_source_repo      = "ClubhouseApi"
    ops_source_repo_path = "infrastructure/Terraform/AWS"
  }
}