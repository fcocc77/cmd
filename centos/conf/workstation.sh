#!/usr/bin/env sh

# Este script cambia la estacion de trabajo permitiendo
# swichear entre el trabajo en el laptop y en el escritorio
# cambiando entre las pantallas y tambien cambia el la tecla alt por windows
# por que el teclado es de osx

edp1=$(xrandr | grep eDP1)
if [[ $edp1 =~ 1920 ]]; then
    xrandr --output eDP1 --off --output HDMI1 --mode 2560x1440 --primary
    setxkbmap -option altwin:swap_alt_win # Esta opcion cambia la tecla alt por windows
else
    xrandr --output HDMI1 --off --output eDP1 --mode 1920x1080 --primary
    setxkbmap -option # deja las opciones por defecto
fi