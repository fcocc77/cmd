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
# ---------------
