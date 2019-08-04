yum groupinstall "MATE Desktop"
echo "exec /usr/bin/mate-session" >> ~/.xinitrc

# Para guardar los valores "dconf dump /org/mate/ > mate_desktop.ini"
dconf load /org/mate/ < mate_desktop.ini