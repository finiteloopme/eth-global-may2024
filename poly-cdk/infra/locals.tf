locals {

  # API services
  project_apis = [
        "compute.googleapis.com",
        "cloudresourcemanager.googleapis.com",
        "container.googleapis.com",
        "artifactregistry.googleapis.com",
        "storage.googleapis.com",
        # Enabling the ServiceUsage API allows the new project to be quota checked from now on.
        "serviceusage.googleapis.com",
        "storagetransfer.googleapis.com",
  ]

  # GKE Information
  cluster_name           = "${var.app_name}-gke"
  network_name           = "${var.app_name}-network"
  subnet_name            = "${var.app_name}-subnet"
  pods_range_name        = "${var.app_name}-pods-ip-range"
  svc_range_name         = "${var.app_name}-svc-ip-range"
  subnet_names           = [
        for subnet_self_link in module.gcp-network.subnets_self_links : split("/", subnet_self_link)[length(split("/", subnet_self_link)) - 1]
        ]
}