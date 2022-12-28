cat << EOF | sudo tee -a /containers_data/dhcp/dhcpd.conf
group {
  option tftp-server-name "10.1.101.12";
  subnet 10.1.101.0 netmask 255.255.255.0 {
    range 10.1.101.101 10.1.101.150;
    option routers 10.1.101.1;
  }
  host spine1 {
    hardware ethernet 52:54:00:6f:ff:4f;
    fixed-address 10.1.101.101;
  }
  host spine2 {
    hardware ethernet 52:54:00:25:d4:1a;
    fixed-address 10.1.101.102;
  }
  host leaf1 {
    hardware ethernet 52:54:00:26:c2:e7;
    fixed-address 10.1.101.111;
  }
  host leaf2 {
    hardware ethernet 52:54:00:8d:75:21;
    fixed-address 10.1.101.112;
  }
  host leaf3 {
    hardware ethernet 52:54:00:60:84:98;
    fixed-address 10.1.101.113;
  }
  host leaf4 {
    hardware ethernet 52:54:00:14:97:83;
    fixed-address 10.1.101.114;
  }
}
EOF