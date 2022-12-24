#!/bin/bash
VM=gw1
DISK=${VM}.img
RAM=16384
SOURCE=/home/irzan/vjunos/vJunos-mx-21.2R3-S1.7.qcow2
cp ${SOURCE} ./image/${DISK}
virt-install --name ${VM} \
	--disk ./image/${DISK},device=disk \
	--cpu host-passthrough  \
	--ram ${RAM} --vcpu 4  \
	--osinfo ubuntu22.04 \
	--network bridge=lan100 \
	--network bridge=l4p2 \
	--network bridge=lan1 \
	--xml './devices/interface[1]/target/@dev=gw1fxp0' \
	--xml './devices/interface[2]/target/@dev=gw1p0' \
	--xml './devices/interface[2]/mtu/@size=9500' \
	--xml './devices/interface[3]/target/@dev=gw1p1' \
	--console pty,target_type=serial \
	--noautoconsole \
	--hvm --accelerate  \
	--vnc  \
	--virt-type=kvm  \
	--boot hd
