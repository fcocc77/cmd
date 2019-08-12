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
su $user -c "dconf load /org/mate/ < ./conf/mate_desktop.ini"
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

# Terminal Color 
theme='PS1="\[\e[0;33m\][\[\e[0;32m\]\u\[\e[0;33m\]@\h:\[\e[0;39m\]\w\[\e[0;33m\]]\$\[\e[0m\] "'
echo $theme > /home/$user/.bashrc
echo  $theme > /root/.bashrc
# -------------------------
# Terminal: ignora mayusculas en el autocomĺetado con el tabulador
echo set completion-ignore-case on > /home/$user/.inputrc
echo set completion-ignore-case on > /root/.inputrc
# --------------------------------------