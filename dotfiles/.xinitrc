
root_password='vfx'

# deja todos los procesadores con la maxima frecuencia
echo $root_password | sudo -S cpupower frequency-set -g performance


# si el monitor HDMI1 esta conectado, deja ese como principal y apaga el del notebook y viceversa
hdmi=$(xrandr | grep HDMI1)
if [[ $hdmi =~ connected ]]; then
    xrandr --output eDP1 --off --output HDMI1 --mode 2560x1440 --primary
else
    xrandr --output HDMI1 --off --output eDP1 --mode 1920x1080 --primary
fi


# cambia el cursor a flecha
xsetroot -cursor_name left_ptr


# cambia el fondo de pantalla
feh --bg-scale ~/Pictures/wallpaper.jpg


# arranca el entorno de escritorio xmonad
exec ~/.cabal/bin/xmonad

