# NVIDIA Driver: Thinkpad P15s

# nvidia driver funciona bien con kernel 5.4lt de elrepo
# 1 - desabilitar nouveau del kernel: rd.driver.blacklist=nouveau nouveau.modeset=0
# 2 - instalar kernel headers: sudo yum --enablerepo=elrepo-kernel install kernel-lt-headers

wget https://us.download.nvidia.com/XFree86/Linux-x86_64/450.119.03/NVIDIA-Linux-x86_64-450.119.03.run -P ~/Downloads
# instalar solo esta version de driver ya que esta permite una mayor temperatura a 94 grados
# antes del estrangulamiento termico, otras versiones solo se podia llegar a
# 57 grados, antes de instalar otra version que no sea esta, verificar el valor 'GPU Max Operating Temp'
# en temperatura: nvidia-smi -q -d Temperature

# gpu-usage: nvidia-smi
# info: nvidia-smi -q
# rendimiento: nvidia-smi -q -d PERFORMANCE
# temperatura: nvidia-smi -q -d Temperature

# desabilitar selinux; sestatus para ver estado
sudo sed -i "s|SELINUX=enforcing|SELINUX=disabled|g" /etc/selinux/config


# Configuracion de nvidia-prime
echo '#!/bin/bash
__NV_PRIME_RENDER_OFFLOAD=1 __VK_LAYER_NV_optimus=NVIDIA_only __GLX_VENDOR_LIBRARY_NAME=nvidia "$@"' \
| sudo tee /usr/bin/prime

sudo chmod 755 /usr/bin/prime

