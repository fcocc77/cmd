root:


mkdir -p /Volumes/
chmod -R ugo+rw /Volumes


mount -t  cifs  //192.168.137.77/VisualFX4 /Volumes/VisualFX4   -o username="JumpCats-001",passwors="vfx",nounix 
umount /Volumes/diskname




automount:




vim /etc/auto.master
     /mnt /etc/auto.cifs --timeout=600 --ghost

vim /etc/auto.cifs
	linux_disk_name   -fstype=cifs,rw,noperm,vers=1.0,username="user",password="pass"   ://ip/disk_name
	mac_disk_name     -fstype=cifs,nounix,sec=ntlmssp,noperm,rw,username="user",password="pass"   ://ip/disk_name

rw "escribir y leer"   
ro "solo leer"





systemctl enable autofs
service autofs start
    


