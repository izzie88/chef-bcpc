#
# Cookbook Name:: bcpc
# Recipe:: ceph-apt
#
# Copyright 2013, Bloomberg Finance L.P.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

#apt_repository "ceph" do
#    uri node['bcpc']['repos']['ceph']
#    distribution node['lsb']['codename']
#    components ["main"]
#    key "ceph-release.key"
#end

# No Trusty packages yet (20140726)
#apt_repository "ceph-extras" do
#    uri node['bcpc']['repos']['ceph-extras']
#    distribution node['lsb']['codename']
#    components ["main"]
#    key "ceph-release.key"
#end

####
# putting the openstack repo here as a test so that there are candidates for the Ceph package installation,
# with the ceph-firefly repo having been commented out

# N.B. These are not needed until Juno comes out for trusty
package "ubuntu-cloud-keyring" do
    action :upgrade
end

apt_repository "openstack" do
    uri node['bcpc']['repos']['openstack']
    distribution "#{node['lsb']['codename']}-#{node['bcpc']['openstack_branch']}/#{node['bcpc']['openstack_release']}"
    components ["main"]
    key "ubuntu-cloud.key"
end

###########

apt_repository "ceph-fcgi" do
    uri node['bcpc']['repos']['ceph-fcgi']
    distribution node['lsb']['codename']
    components ["main"]
    key "ceph-autobuild.key"
end

apt_repository "ceph-apache" do
    uri node['bcpc']['repos']['ceph-apache']
    distribution node['lsb']['codename']
    components ["main"]
    key "ceph-autobuild.key"
end
