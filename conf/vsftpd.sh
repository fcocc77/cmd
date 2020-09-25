#!/bin/sh
#------------------------------
# importante:
# El servidor donde esta el ftp tiene que tener puesta
# la ip del gateway para que se pueda hacer nat desde el router
#------------------------------
yum -y install vsftpd

# Esto no funciona en discos montados director la ruta local_root
# tiene que ser la carpeta padre del disco montado
user=server1
group=server1
ftpdir=/home/ftp
#------------------------------

# dominio global wan
domain="santiago-zone.ddns.net"
# -----------------------

userdir=$ftpdir/$user

useradd $user
passwd $user

mkdir -p $userdir
chown $user:$group -R $userdir
chmod 770 -R $userdir

conf="/etc/vsftpd/vsftpd.conf"

echo "anonymous_enable=NO
local_enable=YES
write_enable=YES
pam_service_name=vsftpd
listen=YES
chroot_local_user=YES
local_root=$ftpdir" >$conf

# pasv es para que funcione en una ip global "wan", en el nat del firewall
# abrir puertos 21 y un rango de 10090-10100
echo "pasv_enable=YES
pasv_min_port=10090
pasv_max_port=10100
pasv_addr_resolve=YES
pasv_address=$domain" >>$conf
# ---------------------------------

echo SELINUX=disabled >/etc/selinux/config
setenforce 0

systemctl restart vsftpd
systemctl enable vsftpd
