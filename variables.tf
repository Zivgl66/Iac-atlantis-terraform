variable "credentials_file_path" {
  # default = "/etc/atlantis/gcp-cred.json"
  description = "The path to the gcp credentials file"
  default = "/home/ziv/git/infratstructure-gitops-project/gcp-cred.json"
}

variable "vpc_name" {
  description = "The name of the VPC network"
  type        = string
  default = "my-vpc"
}

variable "public_subnet_name" {
  description = "The name of the public subnet"
  type        = string
  default = "my-public-subnet"
}

variable "public_subnet_cidr" {
  description = "The CIDR range of the public subnet"
  type        = string
  default = "[0.0.0.0/0]"
}

variable "private_subnet_name" {
  description = "The name of the private subnet"
  type        = string
  default = "my-private-subnet"
}

variable "private_subnet_cidr" {
  description = "The CIDR range of the private subnet"
  type        = string
  default = "[0.0.0.0/0]"
}

variable "region" {
  description = "The region where resources will be created"
  type        = string
  default = "us-east1"
}

variable "nat_router_name" {
  description = "The name of the NAT router"
  type        = string
  default = "my-nat-router"
}

variable "nat_gateway_name" {
  description = "The name of the NAT gateway"
  type        = string
  default = "my-nat-gateway"
}

variable "instance_group" {
  description = "The instance group for the load balancer backend"
  type        = string
  default = "my-group"
}

variable "instance_name" {
  description = "The name of the VM instance"
  type        = string
  default = "my-instance"
}

variable "instance_type" {
  description = "The type of VM instance"
  type        = string
  default = "n1-standard-1"
}

variable "instance_zone" {
  description = "The zone to deploy the VM instance"
  type        = string
  default = "us-east1-d"
}

variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
  default = "my-private-subnet"
}

variable "custom_image" {
  description = "The custom image to use for the instance"
  type        = string
  default = "projects/infrastructure-gitops-project/global/machineImages/weather-app-instance-image"
}

variable "instance_tags" {
  description = "The tags to attach to the instance"
  type        = list(string)
  default = [ "weather-app" ]
}

variable "project_id" {
  description = "The id of the project"
  type        = string
  default = "infrastructure-gitops-project"
}

variable "target_tag" {
  description = "The target tag for the instances"
  type        = string
}