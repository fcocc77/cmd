# Programas generales
yum -y install ffmpeg
yum -y install ntfs-3g # Particiones de windows
yum -y install ntfsprogs
yum -y install vim
yum -y install vlc
yum -y install rclone # Google Drive
yum -y install rclone-browser
yum -y install unar # Descompresor RAR	
yum -y install flattr-icons # Iconos bonitos

# Virtual Box
yum -y --enablerepo=elrepo-kernel install kernel-ml kernel-ml-devel kernel-ml-headers
yum -y install make patch gcc perl
yum -y install VirtualBox-5.2.x86_64
# -------------------------

# Google Chrome
cat << EOF > /etc/yum.repos.d/google-chrome.repo
[google-chrome]
name=google-chrome
baseurl=http://dl.google.com/linux/chrome/rpm/stable/x86_64
enabled=1
gpgcheck=1
gpgkey=https://dl.google.com/linux/linux_signing_key.pub
EOF
yum -y install google-chrome-stable
# ------------------------