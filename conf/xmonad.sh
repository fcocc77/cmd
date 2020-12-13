user=pancho

yum -y install xmonad

echo "exec /usr/bin/gnome-session" >>~/.xinitrc # Inicio de xmonad por defecto
su $user -c "echo exec /usr/bin/gnome-session >> ~/.xinitrc"
