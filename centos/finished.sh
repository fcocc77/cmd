user=pancho
# Virtual Box
/sbin/vboxconfig
# -------------------------

# Wallpappers
cd /home/$user/Pictures
wget "https://u.cubeupload.com/Nd8UdD.png"
cd -
# ----------------------

# Para guardar los valores "dconf dump /org/mate/ > mate_desktop.ini"
sudo -u $user dconf load /org/mate/ < mate_desktop.ini
# -----------------------------

# Wacom PC Button Al iniciar
wacom=/home/$user/.config/autostart/xsetwacom.desktop
cat << EOF >> $wacom
[Desktop Entry]
Type=Application
Name=wacom
Exec=xsetwacom set "Wacom Intuos4 6x9 Pen stylus" TabletPCButton on
EOF
chown $user:$user $wacom
# -------------------