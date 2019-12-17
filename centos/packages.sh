

# Borrar Gnome Desktop
yum -y erase gnome-desktop3
# ----------------------

# Iconos sin la dependencia de KDE
rpm -ivh --nodeps http://li.nux.ro/download/nux/dextop/el7/x86_64//flattr-icons-0-0.1.20141227gitf5218b7.el7.nux.noarch.rpm
# ----------------

packages=(






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
    VirtualBox-5.2
    htop # Top con colores
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


