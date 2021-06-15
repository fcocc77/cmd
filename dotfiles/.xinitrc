root_password='vfx'

# deja todos los procesadores con la frecuencia bajo demanda
echo $root_password | sudo -S cpupower frequency-set -g ondemand

# si el monitor HDMI1 esta conectado, deja ese como principal y apaga el del notebook y viceversa
sh ~/Documents/develop/my-config/scripts/display_switch.sh init

# para que funcione las teclas del F1-F12 en el teclado Keychron
echo $root_password | sudo -S sh -c "tee /sys/module/hid_apple/parameters/fnmode <<< 0"

exec /usr/bin/mate-session

