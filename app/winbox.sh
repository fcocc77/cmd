install_dir="/usr/bin"

cd $install_dir
wget https://download.mikrotik.com/winbox/3.20/winbox.exe

# Acceso directo
echo "[Desktop Entry]
Name=WinBox
Exec=wine $install_dir/winbox.exe
Icon=brasero-symbolic
Categories=Graphics;2DGraphics;RasterGraphics;FLTK;
Type=Application" >"/usr/share/applications/winbox.desktop"
# ---------------
