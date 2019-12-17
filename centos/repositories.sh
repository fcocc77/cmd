# Repositorios
cp conf/*.repo /etc/yum.repos.d
rpm --import http://springdale.math.ias.edu/data/puias/7/x86_64/os/RPM-GPG-KEY-puias
rpm --import https://packages.microsoft.com/keys/microsoft.asc
# --------------------------------------------------

# Lista de repositorios
packages=(
    epel-release
    http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm
    https://www.elrepo.org/elrepo-release-7.0-4.el7.elrepo.noarch.rpm
    https://centos7.iuscommunity.org/ius-release.rpm
)
# -----------------------

yum -y install ${packages[@]}
