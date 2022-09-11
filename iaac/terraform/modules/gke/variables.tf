variable "gke_num_nodes" {
  default     = 2
  description = "number of gke nodes"
}

variable "vpc_network_name" {
  description = "vpc network name"
}

variable "vpc_subnetwork_name" {
  description = "vpc subnetwork name"
}

variable "env" {
  description = "environment"
}