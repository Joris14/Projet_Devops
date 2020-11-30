
#
# NETWORK CONFIGURATION 
#

# Network creation
resource "openstack_networking_network_v2" "main_network" {
  name	= "main_network"
  admin_state_up	= true
}

# Subnet http configuration
resource "openstack_networking_subnet_v2" "main_subnet" {
  name            = "main_subnet"
  network_id      = openstack_networking_network_v2.main_network.id
  cidr            = "192.168.142.0/24"
  ip_version	  = 4
}

# Router interface configuration
resource "openstack_networking_router_interface_v2" "http" {
  router_id = "c56713b7-10bd-4e84-8ff2-2b602e92e385"
  subnet_id = openstack_networking_subnet_v2.main_subnet.id
}