#!/bin/bash
VM=spine2
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
	--network bridge=s2l1 \
	--network bridge=s2l2 \
	--network bridge=s2l3 \
	--network bridge=s2l4 \
	--xml './devices/interface[1]/target/@dev=s2fxp0' \
	--xml './devices/interface[2]/target/@dev=s2p0' \
	--xml './devices/interface[2]/mtu/@size=9500' \
	--xml './devices/interface[3]/target/@dev=s2p1' \
	--xml './devices/interface[3]/mtu/@size=9500' \
	--xml './devices/interface[4]/target/@dev=s2p2' \
	--xml './devices/interface[4]/mtu/@size=9500' \
	--xml './devices/interface[5]/target/@dev=s2p3' \
	--xml './devices/interface[5]/mtu/@size=9500' \
	--console pty,target_type=serial \
	--noautoconsole \
	--hvm --accelerate  \
	--vnc  \
	--virt-type=kvm  \
	--boot hd
