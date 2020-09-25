# instalacion de version actual del 'kernel-ml'
packages=(
    kernel-ml
    # kernel-ml-devel
    # kernel-ml-headers
)

yum -y install https://www.elrepo.org/elrepo-release-7.el7.elrepo.noarch.rpm
yum -y --enablerepo=elrepo-kernel install ${packages[@]}
#

# la version kernel-ml '5.4.6' funciona mucho mas fluido, pero ya la sacaron del repositorio de elrepo,
# asi que la instalamos de otro repositorio espejo 'hoztnode',
# hasta que funcione bien alguna nueva version de 'elrepo'.
hoztnode='http://mirror.hoztnode.net/elrepo/kernel/el7/x86_64/RPMS'

yum -y install $hoztnode/kernel-ml-5.4.6-1.el7.elrepo.x86_64.rpm
yum -y install $hoztnode/kernel-ml-devel-5.4.6-1.el7.elrepo.x86_64.rpm
yum -y install $hoztnode/kernel-ml-headers-5.4.6-1.el7.elrepo.x86_64.rpm
