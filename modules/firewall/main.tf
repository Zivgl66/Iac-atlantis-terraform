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

resource "google_compute_firewall" "allow-https" {
  name    = "allow-https"
  network = var.vpc_name

  allow {
    protocol = "tcp"
    ports    = ["443"]
  }

  source_ranges = ["0.0.0.0/0"]
  
  target_tags = [var.target_tag]

}

# Allow ssh only from your IP - This gets the ip of the source.
data "http" "myip" {
  url = "https://ipv4.icanhazip.com"
}

resource "google_compute_firewall" "allow-ssh" {
  name    = "allow-ssh"
  network = var.vpc_name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["${chomp(data.http.myip.response_body)}/32"]

  target_tags = [var.target_tag]

}