# -------------------------------------
# Service Accounts
# -------------------------------------


# -------------------------------------
# GKE
# -------------------------------------
# GKE Cluster
module "gke" {
  source  = "terraform-google-modules/kubernetes-engine/google//modules/beta-autopilot-public-cluster"
  project_id                      = module.manage-project-apis.project_id
  name                            = local.cluster_name
  region                          = var.gcp_region
  regional                        = true
  network                         = module.gcp-network.network_name
  subnetwork                      = local.subnet_names[index(module.gcp-network.subnets_names, local.subnet_name)]
  ip_range_pods                   = local.pods_range_name
  ip_range_services               = local.svc_range_name
  release_channel                 = "REGULAR"
  deletion_protection             = false
  # Service account used to run nodes
  create_service_account          = true
}

# Ensure GKE SA can pull the image from Artifactory
module "member_roles_for_gke_sa" {
  source                  = "terraform-google-modules/iam/google//modules/member_iam"
  service_account_address = module.gke.service_account
  prefix                  = "serviceAccount"
  project_id              = module.manage-project-apis.project_id
  project_roles           = ["roles/artifactregistry.reader", "roles/logging.viewer", "roles/logging.logWriter", "roles/compute.viewer"]
}

# Required to connect to GKE cluster
data "google_client_config" "default" {}
provider "kubernetes" {
  host                   = "https://${module.gke.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.gke.ca_certificate)
}