user=pancho

yum -y groupinstall "MATE Desktop"

# Borrar Gnome Desktop
yum -y erase gnome-desktop3
# ----------------------

# Instala iconos sin la dependencia de KDE
rpm -ivh --nodeps http://li.nux.ro/download/nux/dextop/el7/x86_64//flattr-icons-0-0.1.20141227gitf5218b7.el7.nux.noarch.rpm
# -------------

# Escritorio MATTE
echo "exec /usr/bin/mate-session" >>~/.xinitrc # Inicio de MATE por defecto
su $user -c "echo exec /usr/bin/mate-session >> ~/.xinitrc"
# ------------------------------------

# Wallpappers
cd /home/$user/Pictures
wget "https://u.cubeupload.com/Nd8UdD.png"
cd -
# ----------------------

# Para guardar los valores "dconf dump /org/mate/ > mate_desktop.ini"
su $user -c "dconf load /org/mate/ < ./conf/mate_desktop.ini"
# -----------------------------
