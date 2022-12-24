cat << EOF  | sudo tee /etc/netplan/01-netcfg.yaml
network:
    version: 2
    # renderer: networkd
    ethernets:
        eth0:
            dhcp4: false
            addresses: [ 10.1.100.12/24]
            gateway4: 10.1.100.1
            nameservers:
                addresses: [ 192.168.10.1 ]
EOF
