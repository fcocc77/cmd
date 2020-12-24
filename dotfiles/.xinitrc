
root_password='vfx'

# deja todos los procesadores con la maxima frecuencia
echo $root_password | sudo -S cpupower frequency-set -g performance


# si el monitor HDMI1 esta conectado, deja ese como principal y apaga el del notebook y viceversa
sh ~/Documents/develop/my-config/scripts/display_switch.sh init

# archivo de recursos de X11
xrdb -merge ~/.Xresources


# cambia el cursor a flecha
xsetroot -cursor_name left_ptr


# cambia el fondo de pantalla
feh --bg-scale ~/Pictures/wallpaper.jpg

# compositor
picom -b --experimental-backend --config ~/.picom.conf


# el audio a veces falla, asi que con esto reiniciamos el audio
killall pulseaudio
pulseaudio --start

# para que funcione las teclas del F1-F12 en el teclado Keychron
echo $root_password | sudo -S sh -c "tee /sys/module/hid_apple/parameters/fnmode <<< 0"


# arranca el entorno de escritorio xmonad
exec ~/.cabal/bin/xmonad

