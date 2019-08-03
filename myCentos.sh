#!/bin/bash
# Estos son los ajustes de inicio par mi de Centos 7 minimal

user=pancho
echo Introducir Clave de GitHub:
read gitpass

# Repositorios Instalacion
	yum -y install epel-release
	yum -y install http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm
	yum -y install https://www.elrepo.org/elrepo-release-7.0-4.el7.elrepo.noarch.rpm
	yum -y install  https://centos7.iuscommunity.org/ius-release.rpm
	wget https://download.virtualbox.org/virtualbox/rpm/el/virtualbox.repo -P /etc/yum.repos.d
# ---------------------

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
yum -y install google-chrome-stable
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
# ---------------------------------------

# Git ------------
yum -y install git2u-all 
	# Configuraciones
	git config --global alias.lod 'log --oneline -10'
	git config --global alias.auto '!git add . && git commit -m "..." && git push'
	github=/home/$user/Documents/GitHub
	mkdir $github
	cd $github
	git clone https://fcocc77:$gitpass@github.com/fcocc77/videovina.git
	git clone https://fcocc77:$gitpass@github.com/fcocc77/cats_farm.git
	git clone https://fcocc77:$gitpass@github.com/fcocc77/cmd.git
	git clone https://fcocc77:$gitpass@github.com/fcocc77/scripts.git
	cd -
	chown $user:$user -R $github

	# Extenciones
	sudo -u $user code \
	--install-extension ms-vscode.cpptools \
	--install-extension ritwickdey.live-sass \
	--install-extension syler.sass-indented \
	--install-extension azemoh.theme-onedark \
	--install-extension foxundermoon.shell-format \
	--install-extension jeff-hykin.better-shellscript-sytax \
	--install-extension vscode-icons-team.vscode-icons
	# -------------
# ----------------------

# Programas generales
	yum -y install deluge # Torrent
	yum -y install ntfs-3g.x86_64 # Particiones de windows
	yum -y install vim
	yum -y install vlc
	
	# Virtual Box
	yum -y --enablerepo=elrepo-kernel install kernel-ml kernel-ml-devel kernel-ml-headers
	yum -y install make patch gcc perl
	yum -y install VirtualBox-5.2.x86_64
	/sbin/vboxconfig
	# -------------------------
	
	yum -y install rclone.x86_64 # Google Drive
	yum -y install unar # Descompresor RAR

	yum -y install python36
	yum -y install python36-pip
	pip3 install --upgrade Django==2.1
	pip3 install Pillow
	pip3 install --upgrade pip

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

# Boot Ajustes
grub2-set-default 0
grub2-mkconfig -o /boot/grub2/grub.cfg
# ---------------------------------

# Wallpappers
cd /home/$user/Pictures
wget "https://u.cubeupload.com/Nd8UdD.png"
sudo -u $user gsettings set org.gnome.desktop.background picture-uri /home/pancho/$user/Nd8UdD.png
cd -
# ----------------------