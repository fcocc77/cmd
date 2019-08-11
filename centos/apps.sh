# Programas generales
yum -y install \
    ffmpeg \
    ntfs-3g \
    ntfsprogs \
    vlc \
    rclone \
    unar \
    flattr-icons \
    xfce4-appfinder \
    wmctrl

# Iconos sin la dependencia de KDE
rpm -ivh --nodeps http://li.nux.ro/download/nux/dextop/el7/x86_64//flattr-icons-0-0.1.20141227gitf5218b7.el7.nux.noarch.rpm
# ----------------

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
# Checkea si xfce4-appfinder esta corriendo
running=$(wmctrl -l|awk '{$3=""; $2=""; $1="";  print $0}')
echo $running
if ! [[ $running =~ "Application Finder" ]]; then
        xfce4-appfinder
fi
xdotool windowactivate $(xdotool search --onlyvisible --class 'xfce4-appfinder' | tail -n1)
#--------------------------
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