resource "google_project_iam_binding" "access_user" {
  role = google_project_iam_custom_role.my_custom_role.id

  members = [
    "user:${var.allowed_user_mail}",
  ]
}
