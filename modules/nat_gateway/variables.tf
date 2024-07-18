variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}

variable "region" {
  description = "The region to deploy resources"
  type        = string
  default     = "us-central1"
}