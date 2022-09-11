terraform {
 required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 3.53, < 5.0"
    }
    random = {
      source = "hashicorp/random"
    }
  }

  required_version = ">= 0.13"
}

provider "google" {
  project = local.project_id
  region  = local.region
}