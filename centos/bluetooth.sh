#!/usr/bin/env sh
# Puias repositorio: https://gist.github.com/yuikns/704cc2d672624e5c56d7
cat << EOF >> /etc/yum.repos.d/puias.repo
[puias_unsupported]
name=PUIAS unsupported Base $releasever - $basearch
mirrorlist=http://puias.math.ias.edu/data/puias/unsupported/$releasever/$basearch/mirrorlist
enabled=1
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puias
EOF

rpm --import http://springdale.math.ias.edu/data/puias/7/x86_64/os/RPM-GPG-KEY-puias
# --------------------------------------------------

# blueman repositorio
cd '/etc/yum.repos.d/'
curl 'https://copr.fedorainfracloud.org/coprs/scx/blueman/repo/epel-7/scx-blueman-epel-7.repo' > 'scx-blueman-epel-7.repo'
# ------------------------------

# Dependencias de blueman
yum -y install python34-gobject blueman
# ----------------------------

# Cambia el env de python3 a python3.4 para que no de conflicto con el python3.6
cd /usr/bin/
bluemans="blueman-adapters blueman-applet blueman-assistant blueman-report blueman-sendto blueman-services"
for i in $bluemans; do
    sed -i 's/python3/python3.4/g' $i
done
# ---------------------------------