#!/bin/sh
#----------------------
user=server5
shared="/media/server_01"
#----------------------

name=$(basename $shared)

yum -y install samba samba-client samba-common
smbpasswd -a $user

echo "[global]
workgroup = WORKGROUP
server string = Samba Server %v
security = user
map to guest = bad user
dns proxy = no

[$name]
path = $shared
browsable =yes
writable = yes
guest ok = no
read only = no
create mask = 0777
directory mask = 0777" > /etc/samba/smb.conf

chcon -Rt samba_share_t $shared

systemctl start smb
systemctl start nmb
systemctl enable smb
systemctl enable nmb