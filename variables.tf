variable "gcp_regions" {
  type = map(string)
  default = {
    "tokyo" = "asia-northeast1"
  }
}

variable "gcp_zones" {
  type = map(string)
  default = {
    "tokyo-a" = "asia-northeast1-a"
    "tokyo-b" = "asia-northeast1-b"
    "tokyo-c" = "asia-northeast1-c"
  }
}

variable "gcp_project_id" {
  type = string
}

variable "firewall_allow_ip_source_ranges" {
  type = list(string)
}

variable "allowed_user_mail" {
  type = string
}
