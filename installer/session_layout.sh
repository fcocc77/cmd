# script para guardar las posiciones de las ventana en una session
sudo dnf -y install wmctrl xprop

cd /tmp
wget https://github.com/arnon-weinberg/session/raw/master/session
chmod 755 ./session
sudo mv session /usr/local/bin

mkdir ~/.config/autostart

echo "[Desktop Entry]
Name=Session Restore
Exec=session restore missing
Type=Application" > ~/.config/autostart/session.desktop
