# gestor de packetes NODEJS
curl -sL https://rpm.nodesource.com/setup_10.x | sudo bash -

# Desarrollo
packages=(
    # Complilacion
    make
    patch
    gcc
    perl
    xorg-x11-server-devel
    mtdev-devel
    dkms

    nodejs

    # Edicion
    python36
    python36-pip
)
sudo yum -y groupinstall "Development Tools"
sudo yum -y install ${packages[@]}
# -------------------

# con esto funciona el qDebug para QT5
sudo mkdir /etc/xdg/QtProject
sudo cat <<EOF >>/etc/xdg/QtProject/qtlogging.ini
[Rules]
*.debug=true
qt.*.debug=false
EOF
# --------------------------------------
