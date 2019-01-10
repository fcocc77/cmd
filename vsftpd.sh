yum install vsftpd

useradd "user"
passwd "user"
userdel -r "user"

# ------------- grupos y propietarios ------------
chmod 770 : permisos al usuario:grupo
chown user:group
#----------------------

vim /etc/vsftpd/vsftpd.conf

#------------------------
anonymous_enable=NO
local_enable=YES
write_enable=YES
pam_service_name=vsftpd
listen=YES
chroot_local_user=YES
ftpd_banner=Bienvenido al servidor FTP de JumpCats
local_root=/home/user
#------------------------

#---------- disable selinux ----------------
vim /etc/selinux/config
	SELINUX=disabled
setenforce 0

#---------------------------

service vsftpd restart
chkconfig vsftpd on
