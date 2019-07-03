#!/bin/bash -x

export DEPLOY_NETWORK_VM=true
export VAGRANT_DEFAULT_PROVIDER=libvirt
export LIBVIRT_QEMU=true
sudo -E make create all
