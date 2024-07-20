resource "google_compute_network" "vpc_network" {
  name = var.vpc_name
}

resource "google_compute_subnetwork" "public_subnet" {
  name          = var.public_subnet_name
  ip_cidr_range = var.public_subnet_cidr
  region        = var.region
  network       = google_compute_network.vpc_network.self_link
}

resource "google_compute_subnetwork" "private_subnet" {
  name          = var.private_subnet_name
  ip_cidr_range = var.private_subnet_cidr
  region        = var.region
  network       = google_compute_network.vpc_network.self_link
}

resource "google_compute_router" "nat_router" {
  name    = var.nat_router_name
  network = google_compute_network.vpc_network.self_link
  region  = var.region
}

resource "google_compute_router_nat" "nat_gateway" {
  name                               = var.nat_gateway_name
  router                             = google_compute_router.nat_router.name
  region                             = var.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}