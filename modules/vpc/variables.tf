variable "vpc_name" {
  description = "The name of the VPC network"
  type        = string
}

variable "public_subnet_name" {
  description = "The name of the public subnet"
  type        = string
}

variable "public_subnet_cidr" {
  description = "The CIDR range of the public subnet"
  type        = string
}

variable "private_subnet_name" {
  description = "The name of the private subnet"
  type        = string
}

variable "private_subnet_cidr" {
  description = "The CIDR range of the private subnet"
  type        = string
}

variable "region" {
  description = "The region where resources will be created"
  type        = string
}

variable "nat_router_name" {
  description = "The name of the NAT router"
  type        = string
}

variable "nat_gateway_name" {
  description = "The name of the NAT gateway"
  type        = string
}