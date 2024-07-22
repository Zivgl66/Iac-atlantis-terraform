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