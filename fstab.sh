# ---------------------
disk="server_01"
ip="192.168.10.10"
# ---------------------
user="server1"
password="vfx"
# ---------------------

# crea directorio de montaje
mkdir /mnt/$disk
# ----------------------------

# borra la linea que contega la ip
sed -i "/$ip/d" /etc/fstab
# ---------------------

echo //$ip/$disk    /mnt/$disk  cifs    rw,noperm,vers=1.0,username=$user,password=$password 0 0 >> /etc/fstab

# actualiza el fstab
mount -a
# -----------------