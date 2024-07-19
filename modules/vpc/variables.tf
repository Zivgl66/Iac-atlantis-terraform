variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}

variable "public_subnet_name" {
  description = "The name of the public subnet"
  type        = string
}

variable "public_subnet_cidr" {
  description = "The CIDR block of the public subnet"
  type        = string
}

variable "private_subnet_name" {
  description = "The name of the private subnet"
  type        = string
}

variable "private_subnet_cidr" {
  description = "The CIDR block of the private subnet"
  type        = string
}

variable "region" {
  description = "The region to deploy resources"
  type        = string
  default     = "us-east1"
}