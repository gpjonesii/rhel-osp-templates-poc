#!/bin/bash
cd /home/stack
source /home/stack/stackrc

openstack overcloud deploy --templates /home/stack/templates \
  --ntp-server 172.24.3.1 \
  --libvirt-type kvm
  --control-flavor control --compute-flavor compute  \
  --control-scale 3        --compute-scale 1  \
  --neutron-tunnel-types vxlan --neutron-network-type vxlan  \
  --neutron-bridge-mappings ext-net:br-external \
  --neutron-network-vlan-ranges ext-net:2401:2420 \
  -e /home/stack/templates/advanced-networking.yaml
