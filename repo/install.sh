repos=(
    epel-release
    http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm
    https://packages.endpoint.com/rhel/7/os/x86_64/endpoint-repo-1.7-1.x86_64.rpm # Git 2
)

yum -y install ${repos[@]}

cp ./*.repo /etc/yum.repos.d/
