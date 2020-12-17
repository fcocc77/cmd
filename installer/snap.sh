# isntala snap, snap es para ejecutar programas de otras distribuciones de linux
sudo yum -y install snapd

# habilita del servicio de snapd
sudo systemctl enable --now snapd.socket

# To enable classic snap support, enter the following to create a symbolic link
sudo ln -s /var/lib/snapd/snap /snap

sudo snap install whatsdesk
sudo snap install spotify
sudo snap install blender --channel=2.83lts/stable --classic

# para ver versiones disponible:
#   snap info 'app name'
