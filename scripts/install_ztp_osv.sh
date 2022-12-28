#!/bin/bash
VM=ztp
DISK=${VM}.qcow2
virt-install --name ${VM} \
	--disk ./${DISK},device=disk,bus=virtio \
	--ram 4096 --vcpu 1  \
    --osinfo ubuntu18.04 \
    --network bridge=br0,virtualport_type=openvswitch \
    --xml './devices/interface/vlan/tag/@id=101' \
	--xml './devices/interface/target/@dev=ztp0' \
	--console pty,target_type=serial \
	--noautoconsole \
	--hvm --accelerate  \
	--vnc  \
	--virt-type=kvm  \
	--boot hd
