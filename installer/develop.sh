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
	python36-pip
)
sudo yum -y groupinstall "Development Tools"
sudo yum -y install ${packages[@]}

# autocompletado de python para vim coc
sudo pip3 install jedi


# con esto funciona el qDebug para QT5
sudo mkdir /etc/xdg/QtProject
echo "[Rules]
*.debug=true
qt.*.debug=false" | sudo tee "/etc/xdg/QtProject/qtlogging.ini"
