
# Create vpc network
module "test-vpc" {
  source = "../../modules/vpc"
  project_id = local.project_id
  region = local.region
}

# Create GKE cluster
module "test-gke-cluster" {
  source = "../../modules/gke"
  project_id = local.project_id
  region = local.region
  env = local.env
  vpc_network_name = module.test-vpc.outputs.vpc_network_name
  vpc_subnetwork_name = module.test-vpc.outputs.vpc_subnetwork_name
}