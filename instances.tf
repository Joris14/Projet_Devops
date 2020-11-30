#
# Create instance
#

resource "openstack_compute_instance_v2" "ubuntu_instance" {
	name 		= "ubuntu_instance"
	image_id 	= "2ea10ad9-4fa6-4cdb-af43-6151321945f7"
	flavor_id	= "2"
	key_pair	= "rom_key"
	network {
    	port = openstack_networking_port_v2.main_port.id
  	}
}

# Create network port
resource "openstack_networking_port_v2" "main_port" {
  name           = "main_port"
  network_id     = openstack_networking_network_v2.main_network.id
  admin_state_up = true

  fixed_ip {
    subnet_id = openstack_networking_subnet_v2.main_subnet.id
  }
}

# Create floating ip
resource "openstack_networking_floatingip_v2" "main_ip" {
  pool = "external"
}

# Attach floating ip to instance
resource "openstack_compute_floatingip_associate_v2" "http" {
  floating_ip = openstack_networking_floatingip_v2.main_ip.address
  instance_id = openstack_compute_instance_v2.ubuntu_instance.id
}
