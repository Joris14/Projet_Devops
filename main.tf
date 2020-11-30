#
# MAIN
#

provider "openstack" {
  user_name   = "xxxxxxx"
  user_domain_name	= "Default"
  password	  = "XXXXXXXXXXXXXXXXXX"
  auth_url    = "http://10.66.10.151:5000/v3/"
}