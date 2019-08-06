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