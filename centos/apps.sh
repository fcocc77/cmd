# Programas generales
yum -y install \
    ffmpeg \
    ntfs-3g \
    ntfsprogs \
    vlc \
    rclone \
    unar \
    flattr-icons \
    xfce4-appfinder

# Virtual Box
yum -y --enablerepo=elrepo-kernel install \ 
    kernel-ml \
    kernel-ml-devel \ 
    kernel-ml-headers \
    make \
    patch \
    gcc \
    perl \
    VirtualBox-5.2
# -------------------------

# En los shortcut de teclado "sh xfce4-appfinder.sh"
cat << EOF >> /usr/bin/xfce4-appfinder.sh
xfce4-appfinder
xdotool windowactivate $(xdotool search --onlyvisible --class 'xfce4-appfinder' | tail -n1)
EOF
# --------------

# Google Chrome
cat << EOF >> /etc/yum.repos.d/google-chrome.repo
[google-chrome]
name=google-chrome
baseurl=http://dl.google.com/linux/chrome/rpm/stable/x86_64
enabled=1
gpgcheck=1
gpgkey=https://dl.google.com/linux/linux_signing_key.pub
EOF
yum -y install google-chrome-stable
# ------------------------