repos=(
    epel-release
    http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm
)

yum -y install ${repos[@]}

cp ./*.repo /etc/yum.repos.d/
