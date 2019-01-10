
# yum update

# yum groupinstall "Development Tools"
# yum install kernel-devel kernel-headers dkms
# lspci -nn | grep VGA
# nano /etc/modprobe.d/blacklist.conf
            add: "blacklist nouveau"

# mv /boot/initramfs-$(uname -r).img /boot/initramfs-$(uname -r).img.bak  
# dracut -v /boot/initramfs-$(uname -r).img $(uname -r)
# reboot
# init 3
#./NVIDIA-Linux*.run
# nvidia-xconfig
# reboot
