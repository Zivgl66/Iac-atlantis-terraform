provider "google" {
  project = "infrastructure-gitops-project"
  region  = "us-east1"
}

module "vpc" {
  source         = "./modules/vpc"
  vpc_name       = "my-vpc-network"
  public_subnet_name  = "my-public-subnet"
  public_subnet_cidr  = "10.0.1.0/24"
  private_subnet_name = "my-private-subnet"
  private_subnet_cidr = "10.0.2.0/24"
  region              = "us-central1"
}

module "firewall" {
  source = "./modules/firewall"
  vpc_name = module.vpc.vpc_name
  target_tag = "weather-app"
}

module "nat_gateway" {
  source         = "./modules/nat_gateway"
  vpc_name       = module.vpc.vpc_name
  public_subnet_name  = module.vpc.public_subnet_name
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