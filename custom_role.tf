resource "google_project_iam_custom_role" "my_custom_role" {
  role_id = "MyCustomRole"
  title   = "My Custom Role"

  permissions = [
    "compute.projects.get",
    "compute.instances.get",
    "compute.instances.setMetadata",
    "iam.serviceAccounts.actAs",
  ]
}
