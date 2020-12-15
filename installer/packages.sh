packages=(
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
    htop       # monitor de actividad
    bind-utils # para usar 'nslookup' ( resuelve dns a ips )
    youtube-dl # descarga de youtube
    alsa-plugins-pulseaudio # driver de audio
	sudo # ejecuta comandos de root en usuario

    # Reproductores de Video:
    mpv
    vlc
)

yum -y install ${packages[@]}
