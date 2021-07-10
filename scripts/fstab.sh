
ip='192.168.1.77'
disk='Documents'

user='pancho'
password='vfx'

mount_folder="/mnt/$disk"

if [ ! -d "$mount_folder" ]; then
    mkdir "$mount_folder"
fi

if grep -qs "$mount_folder" /proc/mounts; then
    sudo umount "$mount_folder"
fi

sudo sed -i "/$disk/d" /etc/fstab

sudo sh -c "echo //$ip/$disk /mnt/$disk cifs rw,noperm,username=$user,password=$password 0 0 >> /etc/fstab"

sudo mount -a
