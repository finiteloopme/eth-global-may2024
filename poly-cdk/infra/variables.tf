variable "project_id" {
  description = "ID for the project"
}

variable "gcp_region" {
  description = "GCP Region"
  default = "us-central1"
}

variable "gcp_zone" {
  description = "GCP Region"
  default = "us-central1-a"
}

variable "app_name" {
  description = "Name of the application"
  default = "poly-cdk"
}
