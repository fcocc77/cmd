yum -y install autofs

# ---------------------
os="linux"
writing=true
# ---------------------
disk="disk1"
ip="192.168.0.77"
# ---------------------
user="pancho"
password="vfx"
# ---------------------

echo /mnt /etc/auto.cifs --timeout=600 --ghost > /etc/auto.master

if $writing; then
	rw=rw
else
	rw=ro
fi

# diferentes metodos si es el disco a montar es linux o mac
if [ $os == "linux" ]; then
	echo $disk -fstype=cifs,$rw,noperm,vers=1.0,username=$user,password=$password ://$ip/$disk > /etc/auto.cifs
else
	echo $disk -fstype=cifs,nounix,sec=ntlmssp,noperm,$rw,username=$user,password=$password ://$ip/$disk > /etc/auto.cifs
fi
# ------------------------------
	
systemctl enable autofs
systemctl restart autofs
    


