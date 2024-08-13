<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | >= 3.5.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_firewall"></a> [firewall](#module\_firewall) | ./modules/firewall | n/a |
| <a name="module_instance"></a> [instance](#module\_instance) | ./modules/instance | n/a |
| <a name="module_load_balancer"></a> [load\_balancer](#module\_load\_balancer) | ./modules/load_balancer | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ./modules/vpc | n/a |

## Resources

| Name | Type |
|------|------|
| [google_firestore_document.lock](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firestore_document) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_credentials_file_path"></a> [credentials\_file\_path](#input\_credentials\_file\_path) | The path to the gcp credentials file | `string` | `"/home/ziv/git/infratstructure-gitops-project/gcp-cred.json"` | no |
| <a name="input_custom_image"></a> [custom\_image](#input\_custom\_image) | The custom image to use for the instance | `string` | `"projects/infrastructure-gitops-project/global/machineImages/weather-app-instance-image"` | no |
| <a name="input_instance_group"></a> [instance\_group](#input\_instance\_group) | The instance group for the load balancer backend | `string` | `"my-group"` | no |
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | The name of the VM instance | `string` | `"my-instance"` | no |
| <a name="input_instance_tags"></a> [instance\_tags](#input\_instance\_tags) | The tags to attach to the instance | `list(string)` | <pre>[<br>  "weather-app"<br>]</pre> | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | The type of VM instance | `string` | `"n1-standard-1"` | no |
| <a name="input_instance_zone"></a> [instance\_zone](#input\_instance\_zone) | The zone to deploy the VM instance | `string` | `"us-east1-d"` | no |
| <a name="input_nat_gateway_name"></a> [nat\_gateway\_name](#input\_nat\_gateway\_name) | The name of the NAT gateway | `string` | `"my-nat-gateway"` | no |
| <a name="input_nat_router_name"></a> [nat\_router\_name](#input\_nat\_router\_name) | The name of the NAT router | `string` | `"my-nat-router"` | no |
| <a name="input_private_subnet_cidr"></a> [private\_subnet\_cidr](#input\_private\_subnet\_cidr) | The CIDR range of the private subnet | `string` | `"[0.0.0.0/0]"` | no |
| <a name="input_private_subnet_name"></a> [private\_subnet\_name](#input\_private\_subnet\_name) | The name of the private subnet | `string` | `"my-private-subnet"` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The id of the project | `string` | `"infrastructure-gitops-project"` | no |
| <a name="input_public_subnet_cidr"></a> [public\_subnet\_cidr](#input\_public\_subnet\_cidr) | The CIDR range of the public subnet | `string` | `"[0.0.0.0/0]"` | no |
| <a name="input_public_subnet_name"></a> [public\_subnet\_name](#input\_public\_subnet\_name) | The name of the public subnet | `string` | `"my-public-subnet"` | no |
| <a name="input_region"></a> [region](#input\_region) | The region where resources will be created | `string` | `"us-east1"` | no |
| <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name) | The name of the subnet | `string` | `"my-private-subnet"` | no |
| <a name="input_target_tag"></a> [target\_tag](#input\_target\_tag) | The target tag for the instances | `string` | n/a | yes |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | The name of the VPC network | `string` | `"my-vpc"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_load_balancer_forwarding_rule_ip"></a> [load\_balancer\_forwarding\_rule\_ip](#output\_load\_balancer\_forwarding\_rule\_ip) | ip for accessing the application through the load balancer |
<!-- END_TF_DOCS -->