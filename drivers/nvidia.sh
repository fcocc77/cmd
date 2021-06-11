
# BumbleBee
# 1 - Hay que cambiar en el /etc/bumblebee/bumblebee.conf "Driver=nvidia"
# 2 - el Display del bumblebee.conf "VirtualDisplay=:8" no puede tener el mismo numero que la
# pantalla principal (echo $DISPLAY) si no da un error
# 3 - añadir el usuario al grup de bumblebee y reiniciar: gpasswd -a user bumblebee

# con esto se puede ver el debug:
#     "optirun -vv glxgears -info"

# copiar xorg nvidia bumblebee
sudo cp ../xorg/nvidia_bumblebee.conf /etc/bumblebee/xorg.conf.nvidia

# NVIDIA Driver
# nvidia driver funciona bien con kernel 5.4lt de elrepo
# 1 - desabilitar nouveau del kernel: rd.driver.blacklist=nouveau nouveau.modeset=0
# 2 - instalar kernel headers: sudo yum --enablerepo=elrepo-kernel install kernel-lt-headers
# 3 - visualizar con nvidia-smi

wget https://es.download.nvidia.com/XFree86/Linux-x86_64/460.73.01/NVIDIA-Linux-x86_64-460.73.01.run -P ~/Downloads


# desabilitar selinux; sestatus para ver estado
sudo sed -i "s|SELINUX=enforcing|SELINUX=disabled|g" /etc/selinux/config

# Acceso directo
echo "[Desktop Entry]
Name=Nvidia Settings
Exec=optirun nvidia-settings -c :8.0
Icon=nvidia-settings
Type=Application" | sudo tee "/usr/share/applications/nvidia-settings.desktop"

