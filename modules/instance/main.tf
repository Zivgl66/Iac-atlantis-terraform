resource "google_compute_instance_from_machine_image" "vm_instance" {
  provider = google-beta
  project = var.project_id
  name         = var.instance_name
  zone         = var.instance_zone

  source_machine_image = var.custom_image


  network_interface {
    network    = var.vpc_name
    subnetwork = var.subnet_name
  }

  tags = var.instance_tags

}

resource "google_compute_instance_group" "instance_group" {
  name       = "${var.instance_name}-group"
  zone       = var.instance_zone
  instances  = [google_compute_instance_from_machine_image.vm_instance.self_link]
  depends_on = [google_compute_instance_from_machine_image.vm_instance]
}