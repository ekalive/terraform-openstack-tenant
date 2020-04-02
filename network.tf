data "openstack_networking_network_v2" "public" {
  name = var.ext_net_name
}

resource "openstack_networking_network_v2" "app_net" {
  name           = "${local.base_name}-network"
  admin_state_up = true
  tenant_id      = openstack_identity_project_v3.tenant.id

  depends_on     = [
    openstack_identity_role_assignment_v3.tenant_admin
  ]
}

resource "openstack_networking_subnet_v2" "app_subnet" {
  name       = "${local.base_name}-subnet"
  network_id = openstack_networking_network_v2.app_net.id
  cidr       = var.network_cidr
  ip_version = 4
  tenant_id  = openstack_identity_project_v3.tenant.id

  depends_on     = [
    openstack_identity_role_assignment_v3.tenant_admin
  ]
}

resource "openstack_networking_router_v2" "app_router" {
  name                = "${local.base_name}-rtr"
  admin_state_up      = true
  external_network_id = data.openstack_networking_network_v2.public.id
  tenant_id           = openstack_identity_project_v3.tenant.id

  depends_on     = [
    openstack_identity_role_assignment_v3.tenant_admin
  ]
}

resource "openstack_networking_router_interface_v2" "subnet_int" {
  router_id = openstack_networking_router_v2.app_router.id
  subnet_id = openstack_networking_subnet_v2.app_subnet.id

  depends_on     = [
    openstack_identity_role_assignment_v3.tenant_admin
  ]
}
