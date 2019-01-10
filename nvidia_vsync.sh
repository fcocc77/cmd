


nano /etc/X11/xorg.conf 

Section "Device"
   Option  "metamodes" "nvidia-auto-select +0+0 { ForceFullCompositionPipeline = On }"
EndSection



nvidia-settings --assign CurrentMetaMode="nvidia-auto-select +0+0 { ForceFullCompositionPipeline = On }"



