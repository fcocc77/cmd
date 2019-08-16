#!/bin/bash

user=pancho
echo Introducir Clave de GitHub:
read gitpass

# Modulos
sh packages.sh 
sh dev_tools.sh $user $gitpass
# -----------------

# En los shortcut de teclado "sh xfce4-appfinder.sh"
cp conf/appfinder.sh /usr/bin/xfce4-appfinder.sh
# --------------

# En los shortcut de teclado "sh workstation.sh"
cp conf/workstation.sh /usr/bin/workstation.sh
# --------------

# Escritorio MATTE
echo "exec /usr/bin/mate-session" >> ~/.xinitrc # Inicio de MATE por defecto
su $user -c "echo exec /usr/bin/mate-session >> ~/.xinitrc"
# ------------------------------------

# copia los xorg configuraciones
cp conf/*.conf /usr/share/X11/xorg.conf.d
# --------------------------

# Boot Ajustes
grub2-set-default 0
grub2-mkconfig -o /boot/grub2/grub.cfg
# ---------------------------------