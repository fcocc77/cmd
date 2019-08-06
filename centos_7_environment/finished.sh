user=pancho


# Virtual Box
/sbin/vboxconfig
# -------------------------

# Para guardar los valores "dconf dump /org/mate/ > mate_desktop.ini"
sudo -u $user dconf load /org/mate/ < mate_desktop.ini