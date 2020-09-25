user="pancho"

# Desarrollo
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
    git
    code
    python36
    python36-pip
    # ------------------
)
yum -y groupinstall "Development Tools"
yum -y install ${packages[@]}
# -------------------

# -------------------
git config --global user.email "fcocc77@gmail.com"
git config --global user.name "Francisco Contreras"
# ignora los permisos de archivos chmod xxx
# git config core.filemode false
# --------------------------------

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

# con esto funciona el qDebug para QT5
mkdir /etc/xdg/QtProject
cat <<EOF >>/etc/xdg/QtProject/qtlogging.ini
[Rules]
*.debug=true
qt.*.debug=false
EOF
# --------------------------------------
