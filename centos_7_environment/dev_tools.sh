user=$1
gitpass=$2

# Git ------------
yum -y install git2u-all 
# Configuraciones
git config --global alias.lod 'log --oneline -10'
git config --global alias.auto '!git add . && git commit -m "..." && git push'
github=/home/$user/Documents/GitHub
mkdir $github
cd $github
git clone https://fcocc77:$gitpass@github.com/fcocc77/videovina.git
git clone https://fcocc77:$gitpass@github.com/fcocc77/cats_farm.git
git clone https://fcocc77:$gitpass@github.com/fcocc77/cmd.git
git clone https://fcocc77:$gitpass@github.com/fcocc77/scripts.git
cd -
chown $user:$user -R $github

# Extenciones
sudo -u $user code \
--install-extension ms-vscode.cpptools \
--install-extension ritwickdey.live-sass \
--install-extension syler.sass-indented \
--install-extension azemoh.theme-onedark \
--install-extension foxundermoon.shell-format \
--install-extension jeff-hykin.better-shellscript-sytax \
--install-extension vscode-icons-team.vscode-icons
# ----------------------

# VSCode
cat << EOF >> /etc/yum.repos.d/vscode.repo
[code]
name=Visual Studio Code
baseurl=https://packages.microsoft.com/yumrepos/vscode
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc
EOF
yum -y install code
# ---------------------------------------

# Python3 y django
yum -y install python36
yum -y install python36-pip
pip3 install --upgrade Django==2.1
pip3 install Pillow
pip3 install --upgrade pip
# ---------------------------------------
