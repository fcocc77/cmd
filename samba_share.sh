#============================ instalar sasmba ==============================

yum install samba samba-client samba-common




#============================ habilitar samba ==============================

-------centos_7---------
systemctl enable smb
systemctl enable nmb


-------centos_6---------
chkconfig smb on
chkconfig nmb on

firewall-cmd --permanent --zone=public --add-service=samba
firewall-cmd --reload


#============================ crear clave samba ==============================

useradd "user"
smbpasswd -a "user"

userdel -r "user"

#============================ editar samba conf ==============================

nano /etc/samba/smb.conf
 

[global]
workgroup = WORKGROUP
server string = Samba Server %v
netbios name = "servername"
security = user
map to guest = bad user
dns proxy = no

#link
follow symlinks = yes
wide links = yes
unix extensions = no
#-----------------

#multichannel
server multi channel support = yes
aio read size = 1
aio write size = 1
#-------------------------------------


["name disk"]
path = "/path"
browsable =yes
writable = yes
guest ok = no
read only = no
create mask = 0777
directory mask = 0777


     
#============================ habilitar ruta ==============================

chcon -Rt samba_share_t "path"


#============================ reiniciar servicios ==============================

service smb restart
service nmb restart
