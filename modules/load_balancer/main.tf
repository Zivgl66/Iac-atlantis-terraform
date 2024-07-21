resource "google_compute_health_check" "default" {
  name                = "tcp-health-check"
  check_interval_sec  = 5
  timeout_sec         = 5
  healthy_threshold   = 2
  unhealthy_threshold = 2

  tcp_health_check {
    port = 5000
  }
}

resource "google_compute_backend_service" "default" {
  name          = "my-backend-service"
  protocol    = "HTTP"
  port_name   = "http"
  timeout_sec = 10
  health_checks = [google_compute_health_check.default.self_link]

  backend {
    group = var.instance_group
  }
  
  log_config {
    enable = true
  }
}

resource "google_compute_url_map" "default" {
  name            = "url-map"
  default_service = google_compute_backend_service.default.self_link
}

resource "google_compute_target_http_proxy" "default" {
  name    = "http-lb-proxy"
  url_map = google_compute_url_map.default.self_link
}

resource "google_compute_global_forwarding_rule" "default" {
  name       = "http-rule"
  target     = google_compute_target_http_proxy.default.self_link
  port_range = "80"
}