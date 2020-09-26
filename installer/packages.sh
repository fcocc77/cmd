packages=(
    # Buscador de applicaciones
    xfce4-appfinder
    wmctrl
    xdotool

    # Google Chrome
    google-chrome-stable

    # otros
    tree
    net-tools
    wget
    ffmpeg
    ntfs-3g
    ntfsprogs
    vlc
    rclone
    unar
    htop       # Top con colores
    bind-utils # para usar 'nslookup' ( resuelve dns a ips )
)

yum -y install ${packages[@]}
