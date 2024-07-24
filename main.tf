resource "google_firestore_document" "lock" {
  project    = "infrastructure-gitops-project"
  database   = "tf-state"
  collection = "terraform_locks"
  document_id = "global_lock"


  fields = jsonencode({
    lock_id = { stringValue = "global" }
  })
}

module "vpc" {
  source              = "./modules/vpc"
  vpc_name            = var.vpc_name
  public_subnet_name  = var.public_subnet_name
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_name = var.private_subnet_name
  private_subnet_cidr = var.private_subnet_cidr
  region              = var.region
  nat_router_name     = var.nat_router_name
  nat_gateway_name    = var.nat_gateway_name
}

module "firewall" {
  source = "./modules/firewall"
  vpc_name = module.vpc.vpc_name
  target_tag = var.target_tag
}


module "instance" {
  source        = "./modules/instance"
  vpc_name      = module.vpc.vpc_name
  subnet_name   = module.vpc.private_subnet_name
  project_id = var.project_id
  instance_name = var.instance_name
  instance_type = var.instance_type
  instance_zone = var.instance_zone
  custom_image  = var.custom_image
  instance_tags = var.instance_tags
  subnetwork_project  = var.project_id
  depends_on          = [module.vpc] 
}



module "load_balancer" {
  source         = "./modules/load_balancer"
  instance_group = module.instance.instance_group
}
