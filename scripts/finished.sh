# Poner en los shortcut de teclado "sh xfce4-appfinder.sh"
cp ../conf/appfinder.sh /usr/bin/xfce4-appfinder.sh
# --------------

# Poner en de teclado "sh workstation.sh"
cp ../conf/workstation.sh /usr/bin/workstation.sh
# --------------

# Boot Ajustes
grub2-set-default 0
grub2-mkconfig -o /boot/grub2/grub.cfg
# ---------------------------------

yum -y update --skip-broken
