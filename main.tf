provider "openstack" {}

locals {
  base_name = "${var.tenant_name}-${var.tenant_environment}"
}

data "openstack_identity_role_v3" "admin" {
  name = "admin"
}

data "openstack_identity_user_v3" "admin_user" {
  name = var.admin_user
}

resource "openstack_identity_project_v3" "tenant" {
  name        = local.base_name
  description = "Project for ${local.base_name}"
}

resource "openstack_identity_role_assignment_v3" "tenant_admin" {
  user_id    = data.openstack_identity_user_v3.admin_user.id
  project_id = openstack_identity_project_v3.tenant.id
  role_id    = data.openstack_identity_role_v3.admin.id
}