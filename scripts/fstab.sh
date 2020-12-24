# ---------------------
disk="server_01"
ip=""
host="santiago-zone.ddns.net"
# ---------------------
user="server1"
password="vfx"
# ---------------------

# resuelve el dominio a ip si es un dominio
if [ ! $ip ]; then
    lastline=$(nslookup $host | tail -n 2)
    list=$(echo $lastline | tr ":" "\n")
    arr=($list)
    ip=${arr[1]}
fi
# ---------------------------

# crea directorio de montaje
mkdir /mnt/$disk
# ----------------------------

# borra la linea que contega el disco
sed -i "/$disk/d" /etc/fstab
# ---------------------

echo //$ip/$disk /mnt/$disk cifs rw,noperm,vers=1.0,username=$user,password=$password 0 0 >>/etc/fstab

# actualiza el fstab
mount -a
# -----------------