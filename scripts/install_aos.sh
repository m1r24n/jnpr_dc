#!/bin/bash
VM=aos
DISK=${VM}.qcow2
# DISK=aos_server_3.3.0.2-46.qcow2
# CDROM=/home/irzan/images/seed.img
virt-install --name ${VM} \
	--disk ./${DISK},device=disk,bus=virtio \
	--ram 32768 --vcpu 4  \
	--cpu host-passthrough  \
	--osinfo ubuntu18.04 \
	--network bridge=lan100,model=virtio \
	--console pty,target_type=serial \
	--noautoconsole \
	--hvm --accelerate  \
	--vnc  \
	--virt-type=kvm  \
	--boot hd
