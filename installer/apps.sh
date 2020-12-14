
packages=(
	gnome-terminal
	nautilus 				# Gestor de Archivos
	nm-connection-editor  	# Network Manager
	gnome-calculator
)
yum -y install ${packages[@]}
