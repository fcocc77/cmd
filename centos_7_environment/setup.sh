#!/bin/bash
# Estos son los ajustes de inicio par mi de Centos 7 minimal

user=pancho
echo Introducir Clave de GitHub:
read gitpass

# Repositorios Instalacion
yum -y install epel-release
yum -y install http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm
yum -y install https://www.elrepo.org/elrepo-release-7.0-4.el7.elrepo.noarch.rpm
yum -y install  https://centos7.iuscommunity.org/ius-release.rpm
wget https://download.virtualbox.org/virtualbox/rpm/el/virtualbox.repo -P /etc/yum.repos.d
yum -y update
# ------------------------

# Google Chrome
cat << EOF > /etc/yum.repos.d/google-chrome.repo
[google-chrome]
name=google-chrome
baseurl=http://dl.google.com/linux/chrome/rpm/stable/x86_64
enabled=1
gpgcheck=1
gpgkey=https://dl.google.com/linux/linux_signing_key.pub
EOF
yum -y install google-chrome-stable
# ------------------------

# Añade los Driver de Intel a Xorg
cat << EOF >> /etc/X11/xorg.conf
Section "Device"
	Option     "TearFree"	"true"
	Option     "AccelMethod"	"sna"
	Driver     "intel"
EndSection
EOF
# ----------------------

# Modulos
sh dev_tools.sh $gitpass
sh apps.sh 
sh mate_desktop.sh
# -----------------

# Boot Ajustes
grub2-set-default 0
grub2-mkconfig -o /boot/grub2/grub.cfg
# ---------------------------------