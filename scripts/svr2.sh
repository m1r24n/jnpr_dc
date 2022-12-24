#!/bin/bash
VM=svr2
DISK=${VM}.img
virt-install --name ${VM} \
	--disk ./image/${DISK},device=disk \
	--ram 4096 --vcpu 1  \
    --osinfo ubuntu22.04 \
	--network bridge=l3p2,model=e1000 \
	--xml './devices/interface[1]/target/@dev=svr2p0' \
	--console pty,target_type=serial \
	--noautoconsole \
	--hvm --accelerate  \
	--vnc  \
	--virt-type=kvm  \
	--boot hd

