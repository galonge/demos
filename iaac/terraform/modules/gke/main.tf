/*****************************************
  GKE Cluster
 *****************************************/
resource "google_container_cluster" "primary" {
  name     = "${var.project_id}-gke-cluster"
  location = var.region
  
  remove_default_node_pool = true
  initial_node_count       = 1

  network    = var.vpc_network_name
  subnetwork = var.vpc_subnetwork_name
}

/*****************************************
  Node Pools
 *****************************************/
resource "google_container_node_pool" "primary_nodes" {
  name       = "${google_container_cluster.primary.name}-node-pool"
  location   = var.region
  cluster    = google_container_cluster.primary.name
  node_count = var.gke_num_nodes

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    labels = {
      env = var.env
      project = var.project_id
    }

    # preemptible  = true
    machine_type = "n1-standard-1"
    tags         = ["gke-node", "${var.project_id}-gke"]
    metadata = {
      disable-legacy-endpoints = "true"
    }
  }
}
