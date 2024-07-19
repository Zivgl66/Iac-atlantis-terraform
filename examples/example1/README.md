# Example 1

This example demonstrates how to use the modules to set up a VPC, firewall rules, a NAT gateway, an instance with a specific tag, and a load balancer.

## Usage

```hcl
provider "google" {
  project = "your-gcp-project-id"
  region  = "us-central1"
}

module "vpc" {
  source = "../../modules/vpc"
  vpc_name = "my-vpc-network"
  public_subnet_name = "my-public-subnet"
  public_subnet_cidr = "10.0.1.0/24"
  private_subnet_name = "my-private-subnet"
  private_subnet_cidr = "10.0.2.0/24"
  region = "us-central1"
}

module "firewall" {
  source = "../../modules/firewall"
  vpc_name = module.vpc.vpc_name
  target_tag = "web-server"
}

module "nat_gateway" {
  source = "../../modules/nat_gateway"
  vpc_name = module.vpc.vpc_name
  region = "us-central1"
}

module "instance" {
  source = "../../modules/instance"
  vpc_name = module.vpc.vpc_name
  subnet_name = module.vpc.private_subnet_name
  instance_name = "my-vm"
  instance_type = "n1-standard-1"
  instance_zone = "us-central1-a"
  custom_image = "projects/your-project-id/global/images/your-custom-image"
  instance_tags = ["web-server"]
}

module "load_balancer" {
  source = "../../modules/load_balancer"
  instance_group = module.instance.instance_group
}
```
