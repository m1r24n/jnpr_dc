#!/bin/bash
for i in s1l{1..4} s2l{1..4} l{1..4}p{2..6}
do
	echo creating bridge $i
	# sudo brctl addbr $i
	sudo ip link add dev $i type bridge
	echo 0x400c | sudo tee  /sys/class/net/${i}/bridge/group_fwd_mask
	sudo ip link set dev $i up
done
