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

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
  default = "my-vpc"
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

variable "subnetwork_project" {
  description = "The subnetwork project ID"
  type        = string
  default = "infrastructure-gitops-project"
}