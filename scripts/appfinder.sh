# Checkea si xfce4-appfinder esta corriendo
running=$(wmctrl -l|awk '{$3=""; $2=""; $1="";  print $0}')
if ! [[ $running =~ "Application Finder" ]]; then
    xfce4-appfinder
fi

if [ $1 == "mate" ]; then
    wmctrl -r "Application Finder" -b add,above # Mantiene la applicacion siempre sobre
    xdotool windowactivate $(xdotool search --onlyvisible --class 'xfce4-appfinder' | tail -n1) # Enfoca la applicacion en primer plano
fi

