### VPC Module variables ###
vpc_name            = "my-vpc-network"
public_subnet_name  = "my-public-subnet"
public_subnet_cidr  = "10.0.1.0/24"
private_subnet_name = "my-private-subnet"
private_subnet_cidr = "10.0.2.0/24"
region              = "us-east1"
nat_router_name     = "nat-router"
nat_gateway_name    = "nat-gateway"


### Firewall Module variables ###
target_tag = "weather-app"


### Instance Module variables ###
project_id = "infrastructure-gitops-project"
instance_name = "weather-app-m1"
instance_type = "n1-standard-1"
instance_zone = "us-east1-c"
custom_image  = "projects/infrastructure-gitops-project/global/machineImages/weather-app-instance-image"
instance_tags = ["weather-app"]



### Load Balancer Module variables ###
