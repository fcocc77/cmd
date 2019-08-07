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

