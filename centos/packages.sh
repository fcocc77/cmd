# Repositorios
cp conf/*.repo /etc/yum.repos.d
rpm --import https://packages.microsoft.com/keys/microsoft.asc
# --------------------------------------------------

# Lista de repositorios
repos=(
    epel-release
    http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm
    https://www.elrepo.org/elrepo-release-7.0-4.el7.elrepo.noarch.rpm
    https://centos7.iuscommunity.org/ius-release.rpm
)
# -----------------------

yum -y install ${repos[@]}

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

yum -y install ${packages[@]}
