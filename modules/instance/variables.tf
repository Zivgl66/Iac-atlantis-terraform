variable "instance_name" {
  description = "The name of the VM instance"
  type        = string
}

variable "instance_type" {
  description = "The type of VM instance"
  type        = string
}

variable "instance_zone" {
  description = "The zone to deploy the VM instance"
  type        = string
}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}

variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
}

variable "custom_image" {
  description = "The custom image to use for the instance"
  type        = string
}