cat << EOF | sudo tee -a /containers_data/dhcp/dhcpd.conf
group {
    option tftp-server-name "10.1.100.12";
    subnet 10.1.100.0 netmask 255.255.255.0 {
      range 10.1.100.101 10.1.100.150;
      option routers 10.1.100.1;
    }
    host spine1 {
      hardware ethernet 52:54:00:79:16:3e;
      fixed-address 10.1.100.101;
    }
    host spine2 {
      hardware ethernet 52:54:00:18:90:b9;
      fixed-address 10.1.100.102;
    }
    host leaf1 {
      hardware ethernet 52:54:00:b8:e3:a8;
      fixed-address 10.1.100.111;
    }
    host leaf2 {
      hardware ethernet 52:54:00:c6:d7:48;
      fixed-address 10.1.100.112;
    }
    host leaf3 {
      hardware ethernet 52:54:00:69:a1:d5;
      fixed-address 10.1.100.113;
    }
    host leaf4 {
      hardware ethernet 52:54:00:72:ff:0b;
      fixed-address 10.1.100.114;
    }
    host gw1 {
      hardware ethernet 52:54:00:9f:81:de;
      fixed-address 10.1.100.120;
    }
}
EOF