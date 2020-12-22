# administrador de pantalla

sudo yum -y install arandr

# arandr necesita la version 1.2 o 1.3 de xrandr y la instalada es la 1.5,
# asi que pasamos por parametro el force version
sudo sed -i 's|Exec=arandr|Exec=arandr --force-version|g' /usr/share/applications/arandr.desktop
