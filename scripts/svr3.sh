#!/bin/bash
VM=svr3
DISK=${VM}.img
virt-install --name ${VM} \
	--disk ./image/${DISK},device=disk \
	--ram 4096 --vcpu 1  \
  	--osinfo ubuntu22.04 \
	--network bridge=br0,virtualport_type=openvswitch \
	--xml './devices/interface[1]/vlan/tag/@id=1' \
	--xml './devices/interface[1]/target/@dev=svr3' \
	--console pty,target_type=serial \
	--noautoconsole \
	--hvm --accelerate  \
	--vnc  \
	--virt-type=kvm  \
	--boot hd

