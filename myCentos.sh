#!/bin/bash
# Estos son los ajustes de inicio par mi de Centos 7 minimal

user=pancho

# Actualizacion de systema
yum -y update
# ------------------------

# Instalacion de GNOME Desktop
yum groupinstall "GNOME Desktop" "Graphical Administration Tools"
ln -sf /lib/systemd/system/runlevel5.target /etc/systemd/system/default.target # Para que inicie en init 5
# ---------------------------

# Google Chrome
cat << EOF > /etc/yum.repos.d/google-chrome.repo
[google-chrome]
name=google-chrome
baseurl=http://dl.google.com/linux/chrome/rpm/stable/x86_64
enabled=1
gpgcheck=1
gpgkey=https://dl.google.com/linux/linux_signing_key.pub
EOF
yum install google-chrome-stable
# ------------------------

# VSCode
cat << EOF >> /etc/yum.repos.d/vscode.repo
[code]
name=Visual Studio Code
baseurl=https://packages.microsoft.com/yumrepos/vscode
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc
EOF
yum -y install code
yum -y install git
	# Extenciones
	sudo -u $user code \
	--install-extension ms-vscode.cpptools \
	--install-extension ritwickdey.live-sass \
	--install-extension syler.sass-indented \
	--install-extension azemoh.theme-onedark \
	--install-extension foxundermoon.shell-format \
	--install-extension jeff-hykin.better-shellscript-sytax
	# -------------
# ----------------------

# Repositorios Instalacion
	yum -y install epel-release
	yum -y install http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm
# ---------------------

# Programas generales
	yum -y install deluge # Torrent
	yum -y install ntfs-3g.x86_64 # Particiones de windows
	# Shell extentions
	yum -y install gnome-shell-extension-system-monitor-applet.noarch
	yum -y install gnome-shell-extension-dash-to-dock.noarch
	yum -y install gnome-shell-extension-no-hot-corner
	
# -------------------------------------


# Gnome Configuraciones
# este comando muestra la lista de las configuraciones que se pueden cambiar "gsettings list-recursively"
	sudo -u $user gsettings set org.gnome.desktop.interface enable-animations false # Desabilita animacion
	sudo -u $user gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true # Cick con el trackpad
	sudo -u $user gsettings set org.gnome.desktop.background show-desktop-icons true # Iconos del escritorio
	sudo -u $user gsettings set org.gnome.nautilus.list-view use-tree-view true # Modo carpetas con ramas



# Dash personalizacion
	dash="sudo -u $user gsettings set org.gnome.shell.extensions.dash-to-dock"
	$dash dash-max-icon-size 35
	$dash dock-position 'BOTTOM'
	$dash running-indicator-style 'DOTS' # Indicador en forma de punto
	$dash custom-theme-customize-running-dots true # Activar cambio de color de dot
	$dash background-opacity 0.5 # Opacidad
	$dash transparency-mode 'FIXED' # Opacidad fija
# ---------------------

# Short Cut Terminal
	shortcut="sudo -u $user gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/"
	$shortcut copy '<Ctrl>c'
	$shortcut paste '<Ctrl>v'
	$shortcut new-tab '<Ctrl>t'
	$shortcut close-tab '<Ctrl>w'
	$shortcut new-window '<Ctrl>n'
	$shortcut close-window '<Ctrl>q'
# -----------------