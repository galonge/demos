/*****************************************
  VPC Network
 *****************************************/
resource "google_compute_network" "vpc" {
  name                    = "${var.resource_prefix}-vpc"
  auto_create_subnetworks = "false"
}

/*****************************************
  Subnetwork
 *****************************************/
resource "google_compute_subnetwork" "subnet" {
  name          = "${var.resource_prefix}-subnet"
  region        = var.region
  network       = google_compute_network.vpc.name
  ip_cidr_range = "10.10.0.0/24"
}