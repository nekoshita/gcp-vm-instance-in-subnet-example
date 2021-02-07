resource "google_service_account" "my_service_account_for_bastion" {
  account_id   = "my-service-account-for-bastion"
  display_name = "My Service Account For Bastion"
}
