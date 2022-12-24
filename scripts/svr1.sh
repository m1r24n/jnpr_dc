#!/bin/bash
VM=svr1
DISK=${VM}.img
virt-install --name ${VM} \
	--disk ./image/${DISK},device=disk \
	--ram 4096 --vcpu 1  \
  	--osinfo ubuntu22.04 \
	--network bridge=l1p2,model=e1000 \
	--network bridge=l2p2,model=e1000 \
	--xml './devices/interface[1]/target/@dev=svr1p0' \
	--xml './devices/interface[2]/target/@dev=svr1p1' \
	--console pty,target_type=serial \
	--noautoconsole \
	--hvm --accelerate  \
	--vnc  \
	--virt-type=kvm  \
	--boot hd

