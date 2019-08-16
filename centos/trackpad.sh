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


git clone https://github.com/p2rkw/xf86-input-mtrack.git
cd xf86-input-mtrack
./configure
make
make install
mv /usr/local/lib/xorg/modules/input/*  /usr/lib64/xorg/modules/input
cd -

cp conf/50-mtrack.conf /usr/share/X11/xorg.conf.d
