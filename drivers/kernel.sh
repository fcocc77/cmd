sudo dnf -y install https://www.elrepo.org/elrepo-release-8.el8.elrepo.noarch.rpm

# kernel-lt es la version estable a largo plazo del kernel
# verificar que se instale el 5.4.112-1
sudo dnf --enablerepo=elrepo-kernel install kernel-lt kernel-lt-devel #kernel-lt-headers
