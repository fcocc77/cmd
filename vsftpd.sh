#!/bin/sh
yum -y install vsftpd

user=public2
group=server5

ftpdir=/media/ftp
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
ftpd_banner=Bienvenido al servidor FTP de JumpCats
local_root=$ftpdir" > $conf

echo SELINUX=disabled > /etc/selinux/config
setenforce 0

systemctl restart vsftpd
systemctl enable vsftpd
