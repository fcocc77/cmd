yum -y install VirtualBox-6.1

# configura el virtualbox en el actual kernel
/sbin/vboxconfig
# -------------------------

# esta extension sirve para usar los usb en la maquina virtual
wget https://download.virtualbox.org/virtualbox/6.1.2/Oracle_VM_VirtualBox_Extension_Pack-6.1.2.vbox-extpack
# se importan a virtualbox en preferences/extensions