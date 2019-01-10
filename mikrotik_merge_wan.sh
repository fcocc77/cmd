WAN1 = 192.168.0.13
WAN2 = 186.10.7.182
LOCAL = 192.168.10.1


/ip firewall mangle
add chain=input in-interface=WAN1 action=mark-connection new-connection-mark=WAN1_conn 
add chain=input in-interface=WAN2 action=mark-connection new-connection-mark=WAN2_conn

add chain=output connection-mark=WAN1_conn action=mark-routing new-routing-mark=to_WAN1 
add chain=output connection-mark=WAN2_conn action=mark-routing new-routing-mark=to_WAN2 

add chain=prerouting dst-address=192.168.0.0/24 action=accept in-interface=LOCAL 
add chain=prerouting dst-address=186.10.7.0/24 action=accept in-interface=LOCAL 

add chain=prerouting dst-address-type=!local in-interface=LOCAL per-connection-classifier=both-addresses-and-ports:2/0 action=mark-connection new-connection-mark=WAN1_conn passthrough=yes 
add chain=prerouting dst-address-type=!local in-interface=LOCAL per-connection-classifier=both-addresses-and-ports:2/1 action=mark-connection new-connection-mark=WAN2_conn passthrough=yes 

add chain=prerouting connection-mark=WAN1_conn in-interface=LOCAL action=mark-routing new-routing-mark=to_WAN1 
add chain=prerouting connection-mark=WAN2_conn in-interface=LOCAL action=mark-routing new-routing-mark=to_WAN2



/ip route
add dst-address=0.0.0.0/0 gateway=192.168.0.1 routing-mark=to_WAN1 check-gateway=ping 
add dst-address=0.0.0.0/0 gateway=186.10.7.177 routing-mark=to_WAN2 check-gateway=ping 

add dst-address=0.0.0.0/0 gateway=192.168.0.1 distance=1 check-gateway=ping 
add dst-address=0.0.0.0/0 gateway=186.10.7.177 distance=2 check-gateway=ping 

/ip firewall nat 
add chain=srcnat out-interface=WAN1 action=masquerade 
add chain=srcnat out-interface=WAN2 action=masquerade