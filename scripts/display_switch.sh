# Este script permuta entre la pantalla del notebook y la pantalla 'dell' o
# inicializa con prioridad la pantalla hdmi en el 'xinitrc'

toggle_file=/tmp/toggle_display

laptop_screen='LVDS'
laptop_format='1366x768'

hdmi_screen='HDMI-0'
hdmi_format='1920x1080'

function init_display()
{
	# si el monitor HDMI1 esta conectado, deja ese como principal y apaga el del notebook y viceversa
	hdmi=$(xrandr | grep $hdmi_screen)
	if [[ $hdmi =~ connected ]]; then
		echo 0 > $toggle_file
		xrandr --output $laptop_screen --off --output $hdmi_screen --mode $hdmi_format --primary
	else
		echo 1 > $toggle_file
		xrandr --output $hdmi_screen --off --output $laptop_screen --mode $laptop_format --primary
	fi
}

function toggle_display()
{
	if [ $(cat $toggle_file) == "0" ]; then
		echo 1 > $toggle_file
		xrandr --output $hdmi_screen --off --output $laptop_screen --mode $laptop_format --primary
	else
		echo 0 > $toggle_file
		xrandr --output $laptop_screen --off --output $hdmi_screen --mode $hdmi_format --primary
	fi
}


if [ "$1" == "init" ]; then
	init_display
else
	toggle_display
fi
