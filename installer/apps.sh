
packages=(
	gnome-terminal
	nautilus 				# Gestor de Archivos
	nm-connection-editor  	# Network Manager
	gnome-calculator
	file-roller-nautilus 	# Extraer archivos comprimidos
	eog 					# Visor de imagenes
)
sudo yum -y install ${packages[@]}
