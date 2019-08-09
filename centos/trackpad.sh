#!/usr/bin/env sh

# Para los gestos
# https://gitlab.com/cunidev/gestures
# # https://github.com/bulletmark/libinput-gestures
# yum -y install xdotool # Ejecuta los shortcut en el terminal
# yum -y install python36-gobject
# # -------------------

# Cambia parametros de X Server en tiempo real
# xinput list
# xinput list-props "Apple Inc. Magic Trackpad 2"
# xinput set-prop "Apple Inc. Magic Trackpad 2" "parameter" value
# --------------------------------------------------

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

    # Velocidad
    Option  "Sensitivity" "0.5"
    # -----------------------

    # Sensibilidad de toque
    Option  "FingerHigh" "1"
    Option  "FingerLow" "1"
    # ---------------------

    # Natural Scroll
    Option  "ScrollUpButton" "5"
    Option  "ScrollDownButton" "4"
    # --------------------------

    # Hasta dónde debe mover sus dedos antes de que se active
    Option  "ScrollDistance" "30"
    # ---------------------------

    # Arrastre con 3 dedos
    Option "SwipeDistance" "1"
    Option "SwipeLeftButton" "1"
    Option "SwipeRightButton" "1"
    Option "SwipeUpButton" "1"
    Option "SwipeDownButton" "1"
    Option "SwipeClickTime" "0"
    Option "SwipeSensitivity" "1000"
    # -----------------------
EndSection
EOF