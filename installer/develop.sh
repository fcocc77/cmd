# gestor de packetes NODEJS
curl -sL https://rpm.nodesource.com/setup_10.x | sudo bash -

# Desarrollo
packages=(
	make
	patch
	gcc
	perl
	xorg-x11-server-devel
	mtdev-devel
	dkms
	nodejs

	python3-devel
	python36
	python36-pip
)
sudo yum -y groupinstall "Development Tools"
sudo yum -y install ${packages[@]}

# con esto funciona el qDebug para QT5
sudo mkdir /etc/xdg/QtProject
echo "[Rules]
*.debug=true
qt.*.debug=false" | sudo tee "/etc/xdg/QtProject/qtlogging.ini"
