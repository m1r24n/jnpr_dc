#!/bin/bash
VM=svr4
DISK=${VM}.img
CDROM=/home/ubuntu/images/seed.iso
virt-install --name ${VM} \
	--disk ${DISK},device=disk \
	--ram 4096 --vcpu 1  \
  	--osinfo ubuntu22.04 \
	--network bridge=br0,model=e1000,virtualport_type=openvswitch \
	--xml './devices/interface/vlan/tag/@id=101' \
	--console pty,target_type=serial \
	--noautoconsole \
	--hvm --accelerate  \
	--vnc  \
	--virt-type=kvm  \
	--boot hd

