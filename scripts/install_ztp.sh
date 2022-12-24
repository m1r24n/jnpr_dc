#!/bin/bash
VM=ztp
DISK=${VM}.qcow2
virt-install --name ${VM} \
	--disk ./${DISK},device=disk,bus=virtio \
	--ram 4096 --vcpu 1  \
  	--osinfo ubuntu18.04 \
	--network bridge=lan100,model=virtio \
	--console pty,target_type=serial \
	--noautoconsole \
	--hvm --accelerate  \
	--vnc  \
	--virt-type=kvm  \
	--boot hd
