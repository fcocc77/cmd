# Programas generales
yum -y install deluge # Torrent
yum -y install ntfs-3g.x86_64 # Particiones de windows
yum -y install vim
yum -y install vlc
yum -y install rclone.x86_64 # Google Drive
yum -y install unar # Descompresor RAR	

# Virtual Box
yum -y --enablerepo=elrepo-kernel install kernel-ml kernel-ml-devel kernel-ml-headers
yum -y install make patch gcc perl
yum -y install VirtualBox-5.2.x86_64
/sbin/vboxconfig
# -------------------------
