resource "google_compute_instance" "vm_instance" {
  name         = var.instance_name
  machine_type = var.instance_type
  zone         = var.instance_zone

  boot_disk {
    initialize_params {
      image = var.custom_image
    }
  }

  network_interface {
    network    = var.vpc_name
    subnetwork = var.subnet_name
  }

  tags = var.instance_tags

}

resource "google_compute_instance_group" "instance_group" {
  name       = "${var.instance_name}-group"
  zone       = var.instance_zone
  instances  = [google_compute_instance.vm_instance.self_link]
  depends_on = [google_compute_instance.vm_instance]
}