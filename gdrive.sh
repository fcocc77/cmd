user=pancho


# -------------------
drive="/home/$user/Google Drive"
# -------------------
sudo -u $user mkdir "$drive"
# -------------------

sudo -u $user rclone sync -P "Google Drive:" "$drive"