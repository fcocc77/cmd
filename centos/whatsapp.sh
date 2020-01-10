# Instala el whatsapp Desktop

# isntala snap, snap es para ejecutar programas de otras distribuciones de linux
yum -y install snapd
# ----------------

# habilita del servicio de snapd
systemctl enable --now snapd.socket
# --------------------

# To enable classic snap support, enter the following to create a symbolic link
ln -s /var/lib/snapd/snap /snap
# --------------------

# install
snap install whatsdesk
# ---------------------

# Acceso directo
echo "[Desktop Entry]
Name=WhatsApp
Exec=snap run whatsdesk
Icon=kblogger
Type=Application" >"/usr/share/applications/whatsapp.desktop"
# ---------------