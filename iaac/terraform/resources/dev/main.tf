
# Create vpc network
module "test-vpc" {
  source = "../../modules/vpc"
  project_id = local.project_id
  region = local.region
  resource_prefix = local.resource_prefix
}

# Create GKE cluster
module "test-gke-cluster" {
  source = "../../modules/gke"
  project_id = local.project_id
  gke_num_nodes = local.gke_num_nodes
  region = local.region
  zone = local.zone
  env = local.env
  resource_prefix = local.resource_prefix
  vpc_network_name = module.test-vpc.vpc_network_name
  vpc_subnetwork_name = module.test-vpc.vpc_subnetwork_name

  depends_on = [
    module.test-vpc
  ]
}