#!/usr/bin/env sh
user=pancho

# -------------------
drive="/home/$user/Google Drive"
# -------------------
mkdir "$drive" &> /dev/null
# -------------------

# Su hacemos push y borramos archivos equivocados quedan en la papelera de google drive
# si queremos recuperarlos

if [ $1 == "pull" ]; then
    rclone sync -P "Google Drive:" "$drive"
elif [ $1 == "push" ]; then
    rclone sync -P "$drive" "Google Drive:"
else
    echo ------------------------------------------------
    echo Argumento incorrecto, intente con pull o push.
    echo ------------------------------------------------
fi