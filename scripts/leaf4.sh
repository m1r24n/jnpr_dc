#!/bin/bash
VM=leaf4
DISK=${VM}.img
RAM=16384
SOURCE=/home/irzan/vjunos/vJunos-ex-21.2R3-S1.7.qcow2
cp ${SOURCE} ./image/${DISK}
virt-install --name ${VM} \
	--disk ./image/${DISK},device=disk \
	--cpu host-passthrough  \
	--ram ${RAM} --vcpu 4  \
  	--osinfo ubuntu22.04 \
	--network bridge=lan100 \
	--network bridge=s1l4 \
	--network bridge=s2l4 \
	--network bridge=l4p2\
	--network bridge=l4p3\
	--network bridge=l4p4\
	--network bridge=l4p5\
	--network bridge=l4p6\
	--xml './devices/interface[1]/target/@dev=l4fxp0' \
	--xml './devices/interface[2]/target/@dev=l4p0' \
	--xml './devices/interface[2]/mtu/@size=9500' \
	--xml './devices/interface[3]/target/@dev=l4p1' \
	--xml './devices/interface[3]/mtu/@size=9500' \
	--console pty,target_type=serial \
	--noautoconsole \
	--hvm --accelerate  \
	--vnc  \
	--virt-type=kvm  \
	--boot hd
