yum install “package”
yum repolist
yum list installed
yum clean all
yum erase “package”
yum search “a buscar”
yum install --downloadonly --downloaddir=<directory> <package>
yum update -y --downloadonly --downloaddir=<directory> 
reposync -r "repo" -p "/path
createrepo /“directory repo”

top -bc |grep name_process


systemctl firewalld
systemctl disable firewalld


nano /etc/hosts



--wacom tap click
xsetwacom set 11 TabletPCButton on

gconf: /desktop/gnome/peripherals/wacom
	editar tablet-pc-button


service httpd start





------------------------auto_login--------------------------

vim /etc/gdm/custom.conf



[daemon]
     AutomaticLoginEnable=True
     AutomaticLogin=username
[security]

[xdmcp]

[greeter]

[chooser]

[debug]

---------------------------------------------------------------








-----------------startup_mount_disk--------------------------


mkdir /media/VisualFX1
mkdir /media/VisualFX2
mkdir /media/VisualFX3

nano /etc/fstab	

	/dev/sdc1                                  /media/VisualFX1  ext4    users        0  0
	/dev/sdd1                                  /media/VisualFX2  ext4    users        0  0
	/dev/sdb1                                  /media/VisualFX3  ext4    users        0  0

	/dev/sdf2                                  /media/hfs+  hfsplus    users,force,rw        0  0

mount -a

-----------------------------------------------------------------
