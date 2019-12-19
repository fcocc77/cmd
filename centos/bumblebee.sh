#!/usr/bin/env sh

packages=(
    # Nvidia Optimus
    bumblebee
    primus
    VirtualGLl
    # ---------------------
)
yum -y install ${packages[@]}

# 1 - agregar la linea "modprobe.blacklist=nouveau" en GRUB_CMDLINE_LINUX en el archivo /etc/default/grub
    # grub2-mkconfig -o /boot/grub2/grub.cfg
    # grub2-mkconfig -o /boot/efi/EFI/centos/grub.cfg
# 2 - instalar los driver oficiales de nvidia, por que solo esos funcionan en el kernel-ml
# 3 - Hay que cambiar en el /etc/bumblebee/bumblebee.conf "Driver=nvidia"
# 4 - agregar el bus ( BusID "PCI:01:00:0" ) de la tarjeta Nvidia en el archivo "/etc/bumblebee/xorg.conf.nvidia"

# con esto se puede ver el debug:
#     "optirun -vv glxgears -info"
#---------------------------------

# lspci | grep VGA

# nota: el Display del bumblebee.conf "VirtualDisplay=:8" no puede tener el mismo numero que la
# pantalla principal (echo $DISPLAY) si no da un error
