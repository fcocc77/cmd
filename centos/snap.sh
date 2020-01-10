# isntala snap, snap es para ejecutar programas de otras distribuciones de linux
yum -y install snapd
# ----------------

# habilita del servicio de snapd
systemctl enable --now snapd.socket
# --------------------

# To enable classic snap support, enter the following to create a symbolic link
ln -s /var/lib/snapd/snap /snap
# --------------------

# whatsapp Desktop
snap install whatsdesk
# ---------------------

# Acceso directo
echo "[Desktop Entry]
Name=WhatsApp
Exec=snap run whatsdesk
Icon=/snap/whatsdesk/current/meta/gui/icon.png
Type=Application
Categories=Network" >"/usr/share/applications/whatsapp.desktop"
# ---------------

# spotify
snap install spotify
# ---------------------

# Acceso directo spotify
echo "[Desktop Entry]
Name=Spotify
Exec=snap run spotify
Icon=/snap/spotify/current/usr/share/spotify/icons/spotify-linux-256.png
Type=Application
Categories=Network" >"/usr/share/applications/spotify.desktop"
# ---------------

# Email
snap install mailspring

# Acceso directo spotify
echo "[Desktop Entry]
Name=Mailspring
Exec=snap run mailspring
Icon=mail_generic
Type=Application
Categories=Network" >"/usr/share/applications/mailspring.desktop"
# ---------------
