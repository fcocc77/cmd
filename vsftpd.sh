#!/bin/sh
#------------------------------
# importante:
# El servidor donde esta el ftp tiene que tener puesta 
# la ip del gateway para que se pueda hacer nat desde el router
#------------------------------
yum -y install vsftpd

# Esto no funciona en discos montados director la ruta local_root 
# tiene que ser la carpeta padre del disco montado
user=pdf
group=server2
ftpdir=/home/ftp
#------------------------------

userdir=$ftpdir/$user

useradd $user
passwd $user

mkdir $userdir
chown $user:$group -R $userdir
chmod 770 -R $userdir

conf="/etc/vsftpd/vsftpd.conf"

echo "anonymous_enable=NO
local_enable=YES
write_enable=YES
pam_service_name=vsftpd
listen=YES
chroot_local_user=YES
local_root=$ftpdir" > $conf

echo SELINUX=disabled > /etc/selinux/config
setenforce 0

systemctl restart vsftpd
systemctl enable vsftpd
