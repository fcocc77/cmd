# Obtiene el repositorio
cd /etc/yum.repos.d
rm virtualbox.repo
wget https://download.virtualbox.org/virtualbox/rpm/rhel/virtualbox.repo
# --------------------------------------------------

yum -y install VirtualBox-6.1

# configura el virtualbox en el actual kernel
/sbin/vboxconfig
# -------------------------