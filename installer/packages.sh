packages=(
    # Buscador de aplicaciones
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
    rclone
    unar
    htop       # Top con colores
    bind-utils # para usar 'nslookup' ( resuelve dns a ips )

    # Descarga de Youtube
    youtube-dl

    # Audio
    alsa-plugins-pulseaudio

    # Reproductores de Video:
    mpv
    vlc
)

yum -y install ${packages[@]}
