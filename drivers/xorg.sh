# instala driver x11, esto es para que funciones el mouse, teclado y otros
xorg_drv=(
	mesa-dri-drivers
	glx-utils
	xorg-x11-xinit # para inicializar session
	xorg-x11-drv-libinput
	xorg-x11-drv-mouse
	xorg-x11-drv-keyboard
	xorg-x11-drv-wacom
	xorg-x11-drv-intel
	xorg-x11-drv-synaptics
)
sudo yum -y install ${xorg_drv[@]}

sudo cp ../xorg/* /etc/X11/xorg.conf.d

# inicio en modo grafico 'init 5'
sudo systemctl set-default graphical.target
