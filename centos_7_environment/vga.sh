# Intel
cat << EOF >> /etc/X11/xorg.conf.d/20-intel.conf
Section "Device"
   Identifier  "Intel Graphics"
   Driver      "intel"
   Option      "TearFree"  "true"
   Option      "AccelMethod"  "sna"
   Option      "TripleBuffer"    "true"
   Option      "SwapbuffersWait"    "true"
EndSection
EOF
# ----------------------

# Nvidia
cat << EOF >> /etc/X11/xorg.conf.d/90-nvidia.conf
Section "Device"
    Option  "metamodes" "nvidia-auto-select +0+0 { ForceFullCompositionPipeline = On }"
    Identifier  "Nvidia Graphics"
    Driver      "nvidia"
    BusID       "PCI:3:0:0"
EndSection
EOF
# ----------------------

# Bumblebee
# Hay que cambiar en el /etc/bumblebee/bumblebee.conf "Driver=nvidia" y
# en /etc/bumblebee/bumblebee.conf poner el id de la tarjeta nvidia "BusID "PCI:01:00:0"
# nota: el Display del bumblebee.conf "VirtualDisplay=:8" no puede tener el mismo numero que la
# pantalla principal (echo $DISPLAY) si no da un error
yum -y install bumblebee primus VirtualGL
yum -y install dkms, kernel-ml-devel
# vim /etc/default/grub
    # Append the following to the GRUB_CMDLINE_LINUX line:
        # modprobe.blacklist=nouveau
# Instalar driver oficiales para kernel-ml
# -----------------------------