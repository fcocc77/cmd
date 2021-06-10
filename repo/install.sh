repos=(
    epel-release
    https://download1.rpmfusion.org/free/el/rpmfusion-free-release-8.noarch.rpm
)

sudo yum -y install ${repos[@]}

sudo cp ./*.repo /etc/yum.repos.d/
