resource "google_compute_firewall" "allow_http" {
  name    = "allow-http-weather-port"
  network = var.vpc_name

  allow {
    protocol = "tcp"
    ports    = ["80", "5000"]
  }

  source_ranges = ["0.0.0.0/0"]

  target_tags = [var.target_tag]
}