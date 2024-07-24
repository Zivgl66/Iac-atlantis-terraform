terraform {
  backend "gcs" {
    bucket  = "tf-state01"
    prefix  = "terraform/terraform.tfstate"
  }
}