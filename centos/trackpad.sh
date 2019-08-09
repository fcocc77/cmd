# https://gitlab.com/cunidev/gestures
# # https://github.com/bulletmark/libinput-gestures
# yum -y install xdotool # Ejecuta los shortcut en el terminal
# yum -y install python36-gobject

# # -------------------

# # xinput list-props "Apple Inc. Magic Trackpad 2"
# # xinput set-prop "Apple Inc. Magic Trackpad 2" "Device Accel Constant Deceleration" 1


# minSpeed=0
# maxSpeed=10
# acceleration=1
# xinput list
# xinput list-props "Apple Inc. Magic Trackpad 2"
# xinput set-prop "Apple Inc. Magic Trackpad 2" "Synaptics Move Speed"  $minSpeed, $maxSpeed, $acceleration, 0
# xinput set-prop "Apple Inc. Magic Trackpad 2" "Synaptics Scrolling Distance" -250, -250


# xinput set-prop "Apple Inc. Magic Trackpad 2" "Trackpad Sensitivity" .5
# xinput set-prop "Apple Inc. Magic Trackpad 2" "Trackpad Smooth Scroll" 2




yum -y install xorg-x11-server-devel
yum -y install mtdev-devel

git clone https://github.com/p2rkw/xf86-input-mtrack.git
cd xf86-input-mtrack
./configure
make
make install
mv /usr/local/lib/xorg/modules/input/*  /usr/lib64/xorg/modules/input

cat << EOF >> /usr/share/X11/xorg.conf.d/50-mtrack.conf
Section "InputClass"
    MatchIsTouchpad "on"
    MatchDevicePath "/dev/input/event*"
    Identifier      "Touchpads"
    Driver          "mtrack"
EndSection
EOF