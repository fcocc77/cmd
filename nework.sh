# -----------------------
interface="enp7s0"
ipNumber=77
ipBase=0
# -----------------------

conf="/etc/sysconfig/network-scripts/ifcfg-$interface"

echo "NAME=red_$interface
DEVICE=$interface
TYPE=Ethernet
IPADDR=192.168.$ipBase.$ipNumber 
NETMASK=255.255.255.0
GATEWAY=192.168.$ipBase.1
DNS1=8.8.8.8
ONBOOT=yes" > $conf

systemctl restart network
