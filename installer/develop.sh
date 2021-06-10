# gestor de packetes NODEJS
curl -sL https://rpm.nodesource.com/setup_12.x | sudo bash -

# Desarrollo
packages=(
	make
	patch
	gcc
    gcc-c++
	perl
	xorg-x11-server-devel
	mtdev-devel
	dkms
	nodejs
    go

	python3-devel
	python36
)

sudo dnf -y groupinstall "Development Tools"
sudo dnf -y install ${packages[@]}

# con esto funciona el qDebug para QT5
sudo mkdir /etc/xdg/QtProject
echo "[Rules]
*.debug=true
qt.*.debug=false" | sudo tee "/etc/xdg/QtProject/qtlogging.ini"
