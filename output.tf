output "tenant_name" {
  value = openstack_identity_project_v3.tenant.name
}

output "environment" {
  value = var.tenant_environment
}

output "network_name" {
  value = openstack_networking_network_v2.app_net.name
}

output "subnet_name" {
  value = openstack_networking_subnet_v2.app_subnet.name
}