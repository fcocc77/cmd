NAME=RedLocal
DEVICE=enp2s0
TYPE=Ethernet
IPADDR=192.168.10.49
NETMASK=255.255.255.0
GATEWAY=192.168.10.1
DNS1=8.8.8.8
ONBOOT=yes

NAME=RedPublica
DEVICE=enp7s1
TYPE=Ethernet
IPADDR=186.10.7.180 
NETMASK=255.255.255.248
GATEWAY=186.10.7.177
DNS1=8.8.8.8
ONBOOT=yes

systemctl restart network
