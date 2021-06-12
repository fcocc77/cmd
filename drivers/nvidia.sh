# NVIDIA Driver
# nvidia driver funciona bien con kernel 5.4lt de elrepo
# 1 - desabilitar nouveau del kernel: rd.driver.blacklist=nouveau nouveau.modeset=0
# 2 - instalar kernel headers: sudo yum --enablerepo=elrepo-kernel install kernel-lt-headers
# 3 - visualizar con nvidia-smi

wget https://es.download.nvidia.com/XFree86/Linux-x86_64/460.73.01/NVIDIA-Linux-x86_64-460.73.01.run -P ~/Downloads

# desabilitar selinux; sestatus para ver estado
sudo sed -i "s|SELINUX=enforcing|SELINUX=disabled|g" /etc/selinux/config


# Configuracion de nvidia-prime
echo '#!/bin/bash
__NV_PRIME_RENDER_OFFLOAD=1 __VK_LAYER_NV_optimus=NVIDIA_only __GLX_VENDOR_LIBRARY_NAME=nvidia "$@"' \
| sudo tee /usr/bin/prime

sudo chmod 755 /usr/bin/prime

