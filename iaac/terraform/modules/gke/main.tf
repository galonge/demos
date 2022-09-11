/*****************************************
  GKE Cluster
 *****************************************/
resource "google_container_cluster" "primary" {
  name     = "${var.env}-${var.resource_prefix}-gke-cluster"
  location = var.zone
  
  remove_default_node_pool = true
  initial_node_count       = 1

  network    = var.vpc_network_name
  subnetwork = var.vpc_subnetwork_name
}

/*****************************************
  Node Pools
 *****************************************/
resource "google_container_node_pool" "primary_nodes" {
  name       = "${var.env}-${var.resource_prefix}-node-pool"
  location   = var.zone
  cluster    = google_container_cluster.primary.name
  node_count = var.gke_num_nodes

  node_config {
    preemptible = true
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/cloud-platform"
    ]

    labels = {
      env = var.env
      project = var.project_id
    }

    # preemptible  = true
    machine_type = "e2-medium"
    tags         = ["gke-node", "${var.env}-${var.resource_prefix}-gke"]
    metadata = {
      disable-legacy-endpoints = "true"
    }
  }
}
