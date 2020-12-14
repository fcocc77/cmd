user=pancho

yum -y install xmonad

echo "exec /usr/bin/xmonad" >>~/.xinitrc # Inicio de xmonad por defecto
su $user -c "echo exec /usr/bin/xmonad >> ~/.xinitrc"
