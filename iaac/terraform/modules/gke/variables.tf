variable "gke_num_nodes" {
  default     = 1
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

variable "project_id" {
  description = "project id"
}
variable "region" {
  description = "region"
}

variable "zone" {
  description = "zone"
}

variable "resource_prefix" {
  description = "resource prefix"
}