output "health_check_name" {
  value = google_compute_health_check.default.name
}

output "backend_service_name" {
  value = google_compute_backend_service.default.name
}

output "url_map_name" {
  value = google_compute_url_map.default.name
}

output "target_http_proxy_name" {
  value = google_compute_target_http_proxy.default.name
}

output "forwarding_rule_name" {
  value = google_compute_global_forwarding_rule.default.name
}

output "forwarding_rule_ip" {
  value = google_compute_global_forwarding_rule.default.ip_address
}