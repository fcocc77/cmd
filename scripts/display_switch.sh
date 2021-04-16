# Este script permuta entre la pantalla del notebook y la pantalla 'dell' o
# inicializa con prioridad la pantalla external en el 'xinitrc'

toggle_file=/tmp/toggle_display

laptop_screen='eDP1'
laptop_format='1920x1080'

external_screen='DP1'
external_format='2560x1440'

function init_display()
{
	# si el monitor HDMI1 esta conectado, deja ese como principal y apaga el del notebook y viceversa
	external=$(xrandr | grep $external_screen)
	if [[ $external =~ connected ]]; then
		echo 0 > $toggle_file
		xrandr --output $laptop_screen --off --output $external_screen --mode $external_format --primary
	else
		echo 1 > $toggle_file
		xrandr --output $external_screen --off --output $laptop_screen --mode $laptop_format --primary
	fi
}

function toggle_display()
{
	if [ $(cat $toggle_file) == "0" ]; then
		echo 1 > $toggle_file
		xrandr --output $external_screen --off --output $laptop_screen --mode $laptop_format --primary
	else
		echo 0 > $toggle_file
		xrandr --output $laptop_screen --off --output $external_screen --mode $external_format --primary
	fi
}


if [ "$1" == "init" ]; then
	init_display
else
	toggle_display
fi
