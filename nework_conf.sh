/etc/sysconfig/network-scripts/ifcfg-eth0

	NAME="RedLocal"
	DEVICE="eth0"
	TYPE=Ethernet

	IPADDR=192.168.10.49
	NETMASK=255.255.255.0
	GATEWAY=192.168.10.1

	DNS1=8.8.8.8


/etc/sysconfig/network-scripts/ifcfg-eth1

	NAME="RedPublica"
	DEVICE="eth1"
	TYPE=Ethernet

	IPADDR=186.10.7.178 
	NETMASK=255.255.255.248
	GATEWAY=186.10.7.177

	DNS1=8.8.8.8





service network restart
