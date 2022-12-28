#!/bin/bash
VM=fw1
DISK=${VM}.img
RAM=4096
VCPU=2
SOURCE=~/images/junos-vsrx3-x86-64-22.4R1.10.qcow2
cp ${SOURCE} ./image/${DISK}
virt-install --name ${VM} \
	--disk ./image/${DISK},device=disk,bus=ide \
	--cpu SandyBridge,+vmx,-invtsc \
	--ram ${RAM} --vcpu ${VCPU}  \
	--arch x86_64 \
	--machine pc \
	--osinfo ubuntu22.04 \
	--network bridge=br0,virtualport_type=openvswitch \
	--network bridge=br0,virtualport_type=openvswitch \
	--network bridge=br0,virtualport_type=openvswitch \
	--xml './devices/interface[1]/vlan/tag/@id=101' \
	--xml './devices/interface[1]/target/@dev=fw1fxp0' \
	--xml './devices/interface[2]/target/@dev=fw1p0' \
	--xml './devices/interface[2]/mtu/@size=9500' \
	--xml './devices/interface[3]/target/@dev=fw1p1' \
	--xml './devices/interface[3]/vlan/tag/@id=1' \
	--console pty,target_type=serial \
	--noautoconsole \
	--hvm --accelerate  \
	--vnc  \
	--virt-type=kvm  \
	--boot hd
