# Este script permuta entre la pantalla del notebook y la pantalla 'dell' o
# inicializa con prioridad la pantalla hdmi en el 'xinitrc'

function init_display()
{
	# si el monitor HDMI1 esta conectado, deja ese como principal y apaga el del notebook y viceversa
	hdmi=$(xrandr | grep HDMI1)
	if [[ $hdmi =~ connected ]]; then
		xrandr --output eDP1 --off --output HDMI1 --mode 2560x1440 --primary
	else
		xrandr --output HDMI1 --off --output eDP1 --mode 1920x1080 --primary
	fi
}

function toggle_display()
{
	toggle_file=/tmp/toggle_display
	if [ $(cat $toggle_file) == "0" ]; then
		echo 1 > $toggle_file
		xrandr --output HDMI1 --off --output eDP1 --mode 1920x1080 --primary
	else
		echo 0 > $toggle_file
		xrandr --output eDP1 --off --output HDMI1 --mode 2560x1440 --primary
	fi
}


if [ "$1" == "init" ]; then
	init_display
else
	toggle_display
fi
