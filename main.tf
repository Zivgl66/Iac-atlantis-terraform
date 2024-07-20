terraform {
  backend "gcs" {
    bucket  = "tf-state01"
    prefix  = "terraform/terraform.tfstate"
  }
  
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 3.5.0"
    }
  }
}

provider "google" {
  credentials = file(var.credentials_file_path)
  project = "infrastructure-gitops-project"
  region  = "us-east1"
}

variable "credentials_file_path" {
  default = "/tmp/infrastructure-gitops-project-6137ba1f55bf.json"
}

resource "google_firestore_document" "lock" {
  project    = "infrastructure-gitops-project"
  database   = "tf-state"
  collection = "terraform_locks"
  document_id = "global_lock"


  fields = jsonencode({
    lock_id = "global"
  })
}

module "vpc" {
  source              = "./modules/vpc"
  vpc_name            = "my-vpc-network"
  public_subnet_name  = "my-public-subnet"
  public_subnet_cidr  = "10.0.1.0/24"
  private_subnet_name = "my-private-subnet"
  private_subnet_cidr = "10.0.2.0/24"
  region              = "us-central1"
  nat_router_name     = "nat-router"
  nat_gateway_name    = "nat-gateway"
}

module "firewall" {
  source = "./modules/firewall"
  vpc_name = module.vpc.vpc_name
  target_tag = "weather-app"
}


module "instance" {
  source        = "./modules/instance"
  vpc_name      = module.vpc.vpc_name
  subnet_name   = module.vpc.private_subnet_name
  instance_name = "weather-app-m"
  instance_type = "n1-standard-1"
  instance_zone = "us-east1-d"
  custom_image  = "projects/infrastructure-gitops-project/global/images/weather-app-instance-image"
  instance_tags = ["weather-app"]

}

module "load_balancer" {
  source         = "./modules/load_balancer"
  instance_group = module.instance.instance_group
}

output "firewall_name" {
  value = module.firewall.firewall_name
}

output "instance_group" {
  value = module.instance.instance_group
}

output "load_balancer_forwarding_rule_ip" {
  value = module.load_balancer.forwarding_rule_ip
}