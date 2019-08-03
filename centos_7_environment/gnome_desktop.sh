# Instalacion de GNOME Desktop
yum groupinstall "GNOME Desktop" "Graphical Administration Tools"
ln -sf /lib/systemd/system/runlevel5.target /etc/systemd/system/default.target # Para que inicie en init 5
# ---------------------------

# Shell extentions
yum -y install gnome-shell-extension-system-monitor-applet.noarch
yum -y install gnome-shell-extension-dash-to-dock.noarch
yum -y install gnome-shell-extension-no-hot-corner
# ------------------

# Gnome Configuraciones
# este comando muestra la lista de las configuraciones que se pueden cambiar "gsettings list-recursively"
	sudo -u $user gsettings set org.gnome.desktop.interface enable-animations false # Desabilita animacion
	sudo -u $user gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true # Cick con el trackpad
	sudo -u $user gsettings set org.gnome.desktop.background show-desktop-icons true # Iconos del escritorio
	sudo -u $user gsettings set org.gnome.nautilus.list-view use-tree-view true # Modo carpetas con ramas
	sudo -u $user gsettings set org.gnome.desktop.wm.preferences button-layout ':,minimize,maximize,close' # Botones de la barra superior
	sudo -u $user gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed true # dash fijo
	sudo -u $user gsettings set org.gnome.shell.extensions.system-monitor cpu-style 'both'
	sudo -u $user gsettings set org.gnome.shell.extensions.system-monitor memory-style 'both'
	sudo -u $user gsettings set org.gnome.shell.extensions.system-monitor icon-display false

# Dash personalizacion
	dash="sudo -u $user gsettings set org.gnome.shell.extensions.dash-to-dock"
	$dash dash-max-icon-size 24
	$dash extend-height true
	$dash custom-theme-shrink true # Padding en los bordes
	$dash dock-position 'BOTTOM'
	$dash running-indicator-style 'DOTS' # Indicador en forma de punto
	$dash custom-theme-customize-running-dots true # Activar cambio de color de dot
	$dash background-opacity 0.5 # Opacidad
	$dash transparency-mode 'FIXED' # Opacidad fija
# ---------------------

# Short Cut 
	#Terminal
	shortcut="sudo -u $user gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/"
	$shortcut copy '<Ctrl>c'
	$shortcut paste '<Ctrl>v'
	$shortcut new-tab '<Ctrl>t'
	$shortcut close-tab '<Ctrl>w'
	$shortcut new-window '<Ctrl>n'
	$shortcut close-window '<Ctrl>q'
	# --------------------
	# Escritorio
	sudo -u $user gsettings set org.gnome.desktop.wm.keybindings show-desktop "['<Primary><Alt>d']" # Mostrar escritorio
# -----------------

# Wallpappers
cd /home/$user/Pictures
wget "https://u.cubeupload.com/Nd8UdD.png"
sudo -u $user gsettings set org.gnome.desktop.background picture-uri /home/pancho/$user/Nd8UdD.png
cd -
# ----------------------