# Repositorios
cp conf/*.repo /etc/yum.repos.d
wget https://copr.fedorainfracloud.org/coprs/scx/blueman/repo/epel-7/scx-blueman-epel-7.repo -P /etc/yum.repos.d
wget https://download.virtualbox.org/virtualbox/rpm/el/virtualbox.repo -P /etc/yum.repos.d
rpm --import http://springdale.math.ias.edu/data/puias/7/x86_64/os/RPM-GPG-KEY-puias
rpm --import https://packages.microsoft.com/keys/microsoft.asc
# --------------------------------------------------

# Borrar Gnome Desktop
yum -y erase gnome-desktop3
# ----------------------

# Iconos sin la dependencia de KDE
rpm -ivh --nodeps http://li.nux.ro/download/nux/dextop/el7/x86_64//flattr-icons-0-0.1.20141227gitf5218b7.el7.nux.noarch.rpm
# ----------------

packages=(
    # Repositorios
    epel-release
    http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm
    https://www.elrepo.org/elrepo-release-7.0-4.el7.elrepo.noarch.rpm
    https://centos7.iuscommunity.org/ius-release.rpm
    # -----------------------

    # Complilacion
    kernel-ml
    kernel-ml-devel
    kernel-ml-headers
    make
    patch
    gcc
    perl
    xorg-x11-server-devel
    mtdev-devel
    dkms
    # -------------------

    # Nvidia Optimus
    bumblebee 
    primus 
    VirtualGLl
    # ---------------------

    # Desarrollo
    git2u-all
    code
    python36
    python36-pip     
    # -------------------

    # Bluetooth
    python34-gobject 
    blueman 
    # -----------------------

    # Buscador de applicaciones
    xfce4-appfinder
    wmctrl
    xdotool
    # ----------------------

    # Google Chrome
    google-chrome-stable
    # --------------------
    
    # otros
    ffmpeg
    ntfs-3g
    ntfsprogs
    vlc
    rclone
    unar
    WoeUSB # Windows USB Booteable
    VirtualBox-5.2
    # ------------------------
)
# -------------------------------------
packagesGroups=(
    "Development Tools"
    "MATE Desktop"
)
# -------------------------------------

yum -y groupinstall ${packagesGroups[@]}
yum -y --enablerepo=elrepo-kernel install ${packages[@]}
yum -y update


