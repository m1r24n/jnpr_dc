cat << EOF | sudo tee -a /containers_data/dhcp/dhcpd.conf
group {
    option tftp-server-name "10.1.100.12";
    subnet 10.1.100.0 netmask 255.255.255.0 {
      range 10.1.100.101 10.1.100.150;
      option routers 10.1.100.1;
    }
    host spine1 {
      hardware ethernet 52:54:00:cc:4f:74;
      fixed-address 10.1.100.101;
    }
    host spine2 {
      hardware ethernet 52:54:00:6a:50:86;
      fixed-address 10.1.100.102;
    }
    host leaf1 {
      hardware ethernet 52:54:00:fb:f2:2f;
      fixed-address 10.1.100.111;
    }
    host leaf2 {
      hardware ethernet 52:54:00:2c:0e:cd;
      fixed-address 10.1.100.112;
    }
    host leaf3 {
      hardware ethernet 52:54:00:4a:65:7d;
      fixed-address 10.1.100.113;
    }
    host leaf4 {
      hardware ethernet 52:54:00:63:30:65;
      fixed-address 10.1.100.114;
    }
}
EOF