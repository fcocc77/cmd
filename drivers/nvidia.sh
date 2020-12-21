# nvidia driver funciona bien con kernel 3.10

# 1 - Hay que cambiar en el /etc/bumblebee/bumblebee.conf "Driver=nvidia"
# 2 - el Display del bumblebee.conf "VirtualDisplay=:8" no puede tener el mismo numero que la
# pantalla principal (echo $DISPLAY) si no da un error

# con esto se puede ver el debug:
#     "optirun -vv glxgears -info"

sudo yum -y install https://www.elrepo.org/elrepo-release-7.el7.elrepo.noarch.rpm

packages=(
	kmod-nvidia
    bumblebee
    primus
)
sudo yum -y install ${packages[@]}


# desabilitar selinux; sestatus para ver estado
sudo sed -i "s|SELINUX=enforcing|SELINUX=disabled|g" /etc/selinux/config

# Acceso directo
echo "[Desktop Entry]
Name=Nvidia Settings
Exec=optirun nvidia-settings -c :8.0
Icon=nvidia-settings
Type=Application" | sudo tee "/usr/share/applications/nvidia-settings.desktop"

# copiar xorg nvidia
sudo cp ../xorg/nvidia_bumblebee.conf /etc/bumblebee/xorg.conf.nvidia
