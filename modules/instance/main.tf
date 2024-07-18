resource "google_compute_instance" "vm_instance" {
  name         = var.instance_name
  machine_type = var.instance_type
  zone         = var.instance_zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network    = var.vpc_name
    subnetwork = var.subnet_name
  }

  metadata_startup_script = <<-EOF
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y python3 python3-pip
    sudo pip3 install flask gunicorn
    cd /home
    git clone https://github.com/yourusername/yourrepository.git
    cd yourrepository
    sudo gunicorn --bind 0.0.0.0:5000 your_app:app
  EOF
}

resource "google_compute_instance_group" "instance_group" {
  name       = "${var.instance_name}-group"
  zone       = var.instance_zone
  instances  = [google_compute_instance.vm_instance.self_link]
  depends_on = [google_compute_instance.vm_instance]
}