# Checkea si xfce4-appfinder esta corriendo
running=$(wmctrl -l|awk '{$3=""; $2=""; $1="";  print $0}')
if ! [[ $running =~ "Application Finder" ]]; then
    xfce4-appfinder
fi
