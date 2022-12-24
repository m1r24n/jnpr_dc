# Setup virtual Lab for Juniper DC solution with Apstra

## Lab Topology
This is the topology of the virtual which will be setup throughout this guide.

![topology](images/topology.png)

## VM in the Lab

|VM | OS | Node| disk Image
|-|-|-|-|
|spine1 | vEX |Spine| vEX disk image|
|spine2 | vEX |Spine|vEX disk image|
|leaf1 | vEX |Server Leaf with ESI-LAG|vEX disk image|
|leaf2 | vEX |Server Leaf with ESI-LAG|vEX disk image|
|leaf3 | vEX |Server Leaf|vEX disk image|
|leaf4 | vEX |Border Leaf|vEX disk image|
|gw1 | vMX | DC gateway|vMX disk image|
|svr1 | ubuntu | Dual-homed server|ubuntu disk image|
|svr2 | ubuntu | Single-homed server| ubuntu disk image|
|svr3 | ubuntu | Dual-homed server|ubuntu disk image|
|apstra| ubuntu | Juniper Apstra server | Juniper Apstra disk image| 
|ztp | ubuntu | Juniper Apstra ZTP server | Juniper Apstra ZTP server disk image|
## Linux bridge for connection between VM

|bridge | node A | Interface on node A| node Z | interface on node Z|
|-|-|-|-|-|
|s1l1|spine1|ge-0/0/0|leaf1| ge-0/0/0|
|s1l2|spine1|ge-0/0/1|leaf2| ge-0/0/0|
|s1l3|spine1|ge-0/0/2|leaf3| ge-0/0/0|
|s1l4|spine1|ge-0/0/3|leaf4| ge-0/0/0|
|s2l1|spine2|ge-0/0/0|leaf1| ge-0/0/1|
|s2l2|spine2|ge-0/0/1|leaf2| ge-0/0/1|
|s2l3|spine2|ge-0/0/2|leaf3| ge-0/0/1|
|s2l4|spine2|ge-0/0/3|leaf4| ge-0/0/1|
|l1p2|leaf1|ge-0/0/2|svr1| ens1|
|l2p2|leaf2|ge-0/0/2|svr1| ens2|
|l3p2|leaf3|ge-0/0/2|svr2| ens1|
|l1p3|leaf1|ge-0/0/3|svr3| ens1|
|l2p3|leaf2|ge-0/0/3|svr3| ens2|
|l4p2|leaf4|ge-0/0/2|gw1| ge-0/0/0|
|lan100|all virtual Junos|fxp0|-|-|


## IP address of the virtual machines

You can use the following table for the ip addresses or you can change it according to your local setup

| Node | Interface | IP address|
|-|-|-|
|spine1| fxp0|10.1.100.101/24|
|spine2| fxp0|10.1.100.102/24|
|leaf1| fxp0|10.1.100.111/24|
|leaf2| fxp0|10.1.100.112/24|
|leaf3| fxp0|10.1.100.113/24|
|leaf4| fxp0|10.1.100.114/24|
|gw1| fxp0|10.1.100.120/24|

## Create and Start the Virtual MAchines
1. Upload the disks image into Server
2. Open ssh session into the server
3. Run the following script [start_bridge.sh](scripts/start_bridge.sh) to create linux bridge
4. Run the following script to create and start vEX/vMX virtual machines. (Remember to pause for 2 minutes between script)
   - [spine1.sh](scripts/spine1.sh)
   - [spine2.sh](scripts/spine2.sh)
   - [leaf1.sh](scripts/leaf1.sh)
   - [leaf2.sh](scripts/leaf2.sh)
   - [leaf3.sh](scripts/leaf3.sh)
   - [leaf4.sh](scripts/leaf4.sh)
   - [gw1.sh](scripts/gw1.sh)

5. Run the following scripts to create and run Juniper Apstra server and Apstra ZTP server
   - [install_aos.sh](scripts/install_aos.sh)
   - [install_ztp.sh](scripts/install_ztp.sh)

## Initial setup of juniper Apstra server
1. 




