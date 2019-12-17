#!/usr/bin/env sh

# repositorio blueman
wget https://copr.fedorainfracloud.org/coprs/scx/blueman/repo/epel-7/scx-blueman-epel-7.repo -P /etc/yum.repos.d
# -------------------

# Bluetooth
packages=(
    python34-gobject
    blueman
)
yum -y install ${packages[@]}
# -----------------------

# Cambia el env de python3 a python3.4 para que no de conflicto con el python3.6
cd /usr/bin/
bluemans="blueman-adapters blueman-applet blueman-assistant blueman-report blueman-sendto blueman-services"
for i in $bluemans; do
    sed -i 's/python3/python3.4/g' $i
done
# ---------------------------------

# Crea dos reglas para que se ejecuten al inicio la interface hci0
# y conectar los dispositivos ya enparentados
cat <<EOF >>/etc/udev/rules.d/10-blueman.rules
ACTION=="add", KERNEL=="hci0", RUN+="/usr/bin/hciconfig hci0 up"
ACTION=="add", KERNEL=="hci0", RUN+="/usr/bin/hciconfig hci0 piscan"
EOF
# -----------------------
# Con el comando hciconfig obtenemos las interface bluetooth que hay en el equipo

# cuando se bloquea "rfkill unblock all"

# Conectar via terminal: hay que seguir tal cual los pasos para que funcione
# hcitool scan  # to get the MAC address of your device
# bluetoothctl
# agent on
# scan on  # wait for your device's address to show up here
# scan off
# info C0:A5:3E:07:00:20
# trust C0:A5:3E:07:00:20
# pair C0:A5:3E:07:00:20
# connect C0:A5:3E:07:00:20
