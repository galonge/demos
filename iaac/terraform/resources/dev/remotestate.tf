terraform {
   backend "gcs" {
    bucket = "bkt-b-gtp-tfstate-01"
    prefix = "tf_state_gtp_dev_resources"
  }
}