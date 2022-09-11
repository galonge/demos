output "vpc_network_name" {
  value       = google_compute_network.vpc.name
  description = "VPC Name"
}

output "vpc_subnetwork_name" {
  value       = google_compute_subnetwork.subnet.name
  description = "Subnet Name"
}