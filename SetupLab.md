# Setup virtual Lab for Juniper DC solution with Apstra

## Lab Topology
This is the topology of the virtual which will be setup throughout this guide.

![topology](images/topology.png)

## VM in the Lab

|VM | OS | Node
|-|-|-|
|spine1 | vEX |Spine|
|spine2 | vEX |Spine|
|leaf1 | vEX |Server Leaf with ESI-LAG|
|leaf2 | vEX |Server Leaf with ESI-LAG|
|leaf3 | vEX |Server Leaf|
|leaf4 | vEX |Border Leaf
|gw1 | vMX | DC gateway|
|svr1 | ubuntu | Dual-homed server|
|svr2 | ubuntu | Single-homed server|
|svr3 | ubuntu | Dual-homed server|


