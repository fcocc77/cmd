#!/usr/bin/env sh

sudo yum -y install https://www.elrepo.org/elrepo-release-7.el7.elrepo.noarch.rpm

packages=(
    # Nvidia Optimus
    bumblebee
    primus
)
sudo yum -y install ${packages[@]}

# añade el usuario al grupo bumblebee
sudo gpasswd -a $USER bumblebee
# --------------------------

# driver nvidia
cd ~/Downloads
# wget http://us.download.nvidia.com/XFree86/Linux-x86_64/440.100/NVIDIA-Linux-x86_64-440.100.run
# funciona con este kernel: 5.4.6-1.el7.elrepo

# 1 - agregar la linea "modprobe.blacklist=nouveau" en GRUB_CMDLINE_LINUX en el archivo /etc/default/grub
# sudo grub2-mkconfig -o /boot/grub2/grub.cfg
# 2 - instalar los driver oficiales de nvidia, por que solo esos funcionan en el kernel-ml
# 3 - Hay que cambiar en el /etc/bumblebee/bumblebee.conf "Driver=nvidia"

# con esto se puede ver el debug:
#     "optirun -vv glxgears -info"
#---------------------------------

# lspci | grep NVIDIA
# optirun glxgears
# optirun glxspheres64n

# nota: el Display del bumblebee.conf "VirtualDisplay=:8" no puede tener el mismo numero que la
# pantalla principal (echo $DISPLAY) si no da un error

# desabilitar selinux
# vim /etc/selinux/config
# poner en disabled
# para ver estado de selinux "sestatus"

# Acceso directo
echo "[Desktop Entry]
Name=Nvidia Settings
Exec=optirun nvidia-settings -c :8.0
Icon=nvidia-settings
Type=Application" | sudo tee "/usr/share/applications/nvidia-settings.desktop"
# ---------------

# nvidia xorg para bumblebee
echo 'Section "ServerLayout"
    Identifier  "Layout0"
    Option      "AutoAddDevices" "false"
    Option      "AutoAddGPU" "false"
EndSection

Section "Screen"
    Identifier     "Screen 0"
    Device         "DiscreteNvidia"
    DefaultDepth    24
    Option         "AllowEmptyInitialConfiguration"
    SubSection     "Display"
        Depth       24
        Modes      "nvidia-auto-select"
    EndSubSection
EndSection

Section "Device"
    Identifier  "DiscreteNvidia"
    Driver      "nvidia"
    VendorName  "NVIDIA Corporation"
    BusID "PCI:01:00:0"
    Option "ProbeAllGpus" "false"
    Option "NoLogo" "true"
    Option "UseEDID" "false"
    Option "UseDisplayDevice" "none"
EndSection' | sudo tee "/etc/bumblebee/xorg.conf.nvidia"
# -------------------------------
