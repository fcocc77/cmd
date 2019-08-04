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

# Añade los Driver de Intel a Xorg
cat << EOF >> /etc/X11/xorg.conf.d/20-intel.conf
Section "Device"
   Identifier  "Intel Graphics"
   Driver      "intel"
   Option      "TearFree"    "true"
   Option      "AccelMethod" "sna"
EndSection
EOF
# ----------------------

# Modulos
sh dev_tools.sh $user $gitpass
sh apps.sh 
# -----------------

# Escritorio MATTE
yum -y groupinstall "MATE Desktop"
echo "exec /usr/bin/mate-session" >> ~/.xinitrc # Inicio de MATE por defecto
sudo -u $user echo "exec /usr/bin/mate-session" >> ~/.xinitrc
# ------------------------------------

# Boot Ajustes
grub2-set-default 0
grub2-mkconfig -o /boot/grub2/grub.cfg
# ---------------------------------

# Borrar Gnome Desktop
yum -y erase gnome-desktop3
# ----------------------
