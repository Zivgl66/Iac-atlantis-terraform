variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
  default = "my-vpc"
}

variable "target_tag" {
  description = "The target tag for the instances"
  type        = string
}