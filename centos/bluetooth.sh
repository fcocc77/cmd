cd '/etc/yum.repos.d/'
curl 'https://copr.fedorainfracloud.org/coprs/scx/blueman/repo/epel-7/scx-blueman-epel-7.repo' > 'scx-blueman-epel-7.repo'

# Dependencias de blueman
yum -y install \
    python36 \
    python36-gobject \
    python36-dbus \
# ----------------------------

yumGet=$(yumdownloader --urls blueman) # Obtiene la url del paquete
url=$(echo $yumGet | sed 's/.* //') # Split de espacio y obtiene el ultimo item

# Instala blueman sin la dependencia de python3.4
rpm -Uvh $url --nodeps
# -------------------------------

# El rpm de blueman instala la libreria de blueman en python 3.4 asi que ahora se mueve hacia la python 3.6
mv /usr/lib/python3.4/site-packages/blueman /usr/lib/python3.6/site-packages/
# -----------------------------------------
