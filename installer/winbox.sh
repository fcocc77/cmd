if [[ $EUID -ne 0 ]]; then
   echo "Execute with root: sudo sh winbox.sh"
   exit 1
fi

dnf -y install wine

install_dir="/usr/bin"

cd $install_dir
wget https://download.mikrotik.com/winbox/3.27/winbox64.exe

# Acceso directo
echo "[Desktop Entry]
Name=WinBox
Exec=wine $install_dir/winbox64.exe
Icon=brasero-symbolic
Categories=Graphics;2DGraphics;RasterGraphics;FLTK;
Type=Application" >"/usr/share/applications/winbox.desktop"

firewall-cmd --zone=public --permanent --add-port 8291/tcp
firewall-cmd --reload

