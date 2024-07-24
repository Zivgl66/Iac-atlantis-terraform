# output "firewall_name" {
#   value = module.firewall.firewall_name
# }

# output "instance_group" {
#   value = module.instance.instance_group
# }

output "load_balancer_forwarding_rule_ip" {
  value = module.load_balancer.forwarding_rule_ip
}