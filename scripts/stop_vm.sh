#!/bin/bash

for i in leaf{1..4} spine{1..2}
do
	virsh destroy $i
	#rm ${i}.img
	#cp ${SOURCE} ${i}.img
done
