#!/bin/bash
user="pancho"
password="vfx"
# -----------
# este script bloquea el acceso al internet a una applicacion especifica
# -----------

# para que funcione el sudo en el usuario, solo funciona en root, ¡ reiniciar para que tenga efecto !
#   usermod -aG wheel "user"
# ----------------------------

# crea un grupo llamado no-internet, solo si no existe
echo $password | sudo -S groupadd no-internet
# -----------------------

# el cortafuego tiene que estar activado
sudo systemctl start firewalld
# ---------------------

# borra todas las reglas iptables
sudo iptables -P INPUT ACCEPT
sudo iptables -P FORWARD ACCEPT
sudo iptables -P OUTPUT ACCEPT
sudo iptables -t nat -F
sudo iptables -t mangle -F
sudo iptables -F
sudo iptables -X
# -------------------------

# permite el acceso local en el grupo no-internet
sudo iptables -A OUTPUT -o lo -m owner --gid-owner no-internet -j ACCEPT
# ---------------------

# permite el acceso al puerto 771 de la ip local de vmanager
sudo iptables -A OUTPUT -p tcp -d "192.168.10.10" --dport 771 -j ACCEPT
# -------------------------------

# bloque el acceso a internet el el grupo no-internet
sudo iptables -A OUTPUT -m owner --gid-owner no-internet -j DROP
# ------------------------

# añadimos nuestro usuario en el grupo no-internet, esto es para poder usar este grupo en usuario
sudo usermod -aG no-internet $user
# ------------------------------

# ejecuta una app en el grupo no-internet, ya que en ese grupo tiene
# reglas de iptable que bloquean el internet, la app queda sin internet
sg no-internet "$1"
# ---------------------------

# asi se ejecuta el nuke con ni.sh y optirun
    # sh /home/pancho/Documents/GitHub/scripts/ni.sh 'optirun "/usr/local/Nuke9.0v9/Nuke9.0" --nukex'
# ----------------------------
