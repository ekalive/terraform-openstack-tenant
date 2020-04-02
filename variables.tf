variable "tenant_name" {
  description = "Name of your application"
}

variable "tenant_environment" {
  description = "Name of the environment"
}

variable "admin_user" {
  default     = "admin"
  description = "OpenStack user to make administrator of the application project"
}

variable "tenant_network" {
  default     = "10.0.0.0/24"
  description = "Network CIDR for the application subnet"
}

variable "ext_net_name" {
  default     = "public"
  description = "Name of the externel network for NAT or floating IPs"
}

variable "network_cidr" {
  default     = "10.0.0.0/24"
  description = "Network range for subnet"
}
