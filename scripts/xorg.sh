# instala driver x11, esto es para que funciones el mouse, teclado y otros
xorg_drv=(
    xorg-x11-drv-libinput
    xorg-x11-drv-mouse
    xorg-x11-drv-keyboard
    xorg-x11-drv-wacom
    xorg-x11-drv-intel
)
yum -y install ${xorg_drv[@]}
# ------------------------

# Intel
echo 'Section "Device"
    Identifier  "Intel Graphics"
    Driver      "intel"
    Option      "TearFree"  "true"
    Option      "AccelMethod"  "sna"
    Option      "TripleBuffer"    "true"
    Option      "SwapbuffersWait"    "true"
EndSection' >"/usr/share/X11/xorg.conf.d/20-intel.conf"
# ---------------

# Wacom
echo 'Section "InputClass"
    Identifier "Wacom USB tablet class"
    MatchUSBID "056a:*"
    MatchDevicePath "/dev/input/event*"
    MatchIsTablet "true"
    Option "TPCButton" "on"
    Driver "wacom"
EndSection' >"/usr/share/X11/xorg.conf.d/40-wacom.conf"
# ---------------

# Nvidia
echo 'Section "Device"
    Option  "metamodes" "nvidia-auto-select +0+0 { ForceFullCompositionPipeline = On }"
    Identifier  "Nvidia Graphics"
    Driver      "nvidia"
    BusID       "PCI:3:0:0"
EndSection' >"/usr/share/X11/xorg.conf.d/90-nvidia.conf"
# ---------------
