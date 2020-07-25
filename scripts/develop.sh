user="pancho"
gitpass="password"

# Desarrollo
yum erase -y git
packages=(
    # Complilacion
    make
    patch
    gcc
    perl
    xorg-x11-server-devel
    mtdev-devel
    dkms
    # -------------------

    # Edicion
    git2u-all
    code
    python36
    python36-pip
    # ------------------
)
yum -y groupinstall "Development Tools"
yum -y install ${packages[@]}
# -------------------

# Configuraciones git
lod="git config --global alias.lod 'log --oneline -10'"
auto="git config --global alias.auto '!git add . && git commit -m "..." && git push'"
# root
eval $lod
eval $auto
# -----
# user
su $user -c "$lod"
su $user -c "$auto"
# -------------------
git config --global user.email "fcocc77@gmail.com"
git config --global user.name "Francisco Contreras"
# ignora los permisos de archivos chmod xxx
# git config core.filemode false
# --------------------------------

# copiar repositorios
github=/home/$user/Documents/GitHub
mkdir $github
cd $github
git clone https://fcocc77:$gitpass@github.com/fcocc77/videovina.git
git clone https://fcocc77:$gitpass@github.com/fcocc77/vinarender.git
git clone https://fcocc77:$gitpass@github.com/fcocc77/cmd.git
git clone https://fcocc77:$gitpass@github.com/fcocc77/scripts.git
cd -
chown $user:$user -R $github
# ----------------------

# Extenciones vscode
su $user -c "code \
    --install-extension ms-vscode.cpptools \
    --install-extension ritwickdey.live-sass \
    --install-extension syler.sass-indented \
    --install-extension azemoh.theme-onedark \
    --install-extension foxundermoon.shell-format \
    --install-extension jeff-hykin.better-shellscript-syntax \
    --install-extension jeff-hykin.better-cpp-syntax \
    --install-extension vscode-icons-team.vscode-icons \
    --install-extension coolbear.systemd-unit-file \
    --install-extension usernamehw.remove-empty-lines \
    --install-extension batisteo.vscode-django \
    --install-extension seanwu.vscode-qt-for-python \
    --install-extension ms-python.python \
    --install-extension sandy081.todotasks \
    --install-extension devmike.mikrotik-routeros-script"
# ----------------------

# Python3 y django
pip3 install --upgrade Django==2.1
pip3 install Pillow
pip3 install --upgrade pip
# ---------------------------------------

# con esto funciona el qDebug para QT5
mkdir /etc/xdg/QtProject
cat <<EOF >>/etc/xdg/QtProject/qtlogging.ini
[Rules]
*.debug=true
qt.*.debug=false
EOF
# --------------------------------------
