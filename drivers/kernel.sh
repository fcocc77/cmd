packages=(
    kernel-ml-5.4.6-1.el7.elrepo.x86_64
    kernel-ml-devel-5.4.6-1.el7.elrepo.x86_64
    kernel-ml-headers-5.4.6-1.el7.elrepo.x86_64
)

yum -y install https://www.elrepo.org/elrepo-release-7.0-4.el7.elrepo.noarch.rpm
yum -y --enablerepo=elrepo-kernel install ${packages[@]}