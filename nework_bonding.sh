#----------------------------------------
#/etc/sysconfig/network-scripts/ifcfg-bond0
 
DEVICE=bond0
NAME=bond0
TYPE=Bond
IPADDR=192.168.10.43
NETMASK=255.255.255.0
GATEWAY=192.168.10.1
DNS1=8.8.8.8
ONBOOT=yes
BOOTPROTO=none
USERCTL=no
#----------------------------------------



#----------------------------------------
#/etc/sysconfig/network-scripts/ifcfg-eth0
 
DEVICE=eth0
NAME=eth0
TYPE=Ethernet
ONBOOT=yes
BOOTPROTO=none
USERCTL=no
MASTER=bond0
SLAVE=yes
#----------------------------------------



#------------------------------
vim /etc/modprobe.d/bonding.conf

alias bond0 bonding
options bond0 mode=5 miimon=100
#-------------------------------------


#---------------------------------
vim /etc/sysconfig/network

NM_BOND_BRIDGE_VLAN_ENABLED=yes
#-------------------------------------



service network restart
service NetworkManager restart


restart computer