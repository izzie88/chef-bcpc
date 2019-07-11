###############################################################################
# cinder
###############################################################################

default['bcpc']['cinder']['db']['dbname'] = 'cinder'

default['bcpc']['cinder']['debug'] = false
default['bcpc']['cinder']['workers'] = nil
default['bcpc']['cinder']['allow_az_fallback'] = true
default['bcpc']['cinder']['rbd_flatten_volume_from_snapshot'] = true
default['bcpc']['cinder']['rbd_max_clone_depth'] = 5
default['bcpc']['cinder']['database']['max_overflow'] = 10
default['bcpc']['cinder']['database']['max_pool_size'] = 5
default['bcpc']['cinder']['quota'] = {
  'volumes' => -1,
  'snapshots' => 10,
  'gigabytes' => 1000,
}

# Identity
default['bcpc']['cinder']['user'] = 'cinder'
default['bcpc']['cinder']['wsgi']['processes'] = 1
default['bcpc']['cinder']['wsgi']['threads'] = 1

# ceph (rbd)
default['bcpc']['cinder']['ceph']['user'] = 'cinder'
default['bcpc']['cinder']['ceph']['pool']['name'] = 'volumes'
default['bcpc']['cinder']['ceph']['pool']['size'] = 1
