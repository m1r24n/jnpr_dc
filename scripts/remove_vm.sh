#!/bin/bash
for i in leaf{1..4} spine{1..2}
do
	virsh undefine $i
	rm ${i}.img
done
