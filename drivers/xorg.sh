# instala driver x11, esto es para que funciones el mouse, teclado y otros
xorg_drv=(
	xorg-x11-xinit # para inicializar session
    xorg-x11-drv-libinput
    xorg-x11-drv-mouse
    xorg-x11-drv-keyboard
    xorg-x11-drv-wacom
    xorg-x11-drv-intel
    xorg-x11-drv-synaptics
)
yum -y install ${xorg_drv[@]}

cp ../xorg/* /etc/X11/xorg.conf.d
