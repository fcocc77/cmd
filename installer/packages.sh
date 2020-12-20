packages=(
    # Google Chrome
    google-chrome-stable

    # otros
    tree
    net-tools
    wget
    ffmpeg
	pciutils # lspci
    ntfs-3g
    ntfsprogs
    rclone
    unar
    htop       # monitor de actividad
    bind-utils # para usar 'nslookup' ( resuelve dns a ips )
    youtube-dl # descarga de youtube
    alsa-plugins-pulseaudio # driver de audio
	xfce4-appfinder # buscador de aplicaciones
	gparted # administrador de discos

    # Reproductores de Video:
    mpv
    vlc
)

sudo yum -y install ${packages[@]}
