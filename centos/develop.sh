user="pancho"

# Desarrollo
yum erase -y git 
packages=(
    # Complilacion
    kernel-ml
    kernel-ml-devel
    kernel-ml-headers
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
yum -y install ${packages[@]}
yum -y groupinstall "Development Tools"
# -------------------

# Configuraciones git
su $user -c git config --global alias.lod 'log --oneline -10'
su $user -c git config --global alias.auto '!git add . && git commit -m "..." && git push'
# -------------------

# Extenciones vscode
su $user -c code \
    --install-extension ms-vscode.cpptools \
    --install-extension ritwickdey.live-sass \
    --install-extension syler.sass-indented \
    --install-extension azemoh.theme-onedark \
    --install-extension foxundermoon.shell-format \
    --install-extension jeff-hykin.better-shellscript-sytax \
    --install-extension jeff-hykin.better-cpp-syntax \
    --install-extension vscode-icons-team.vscode-icons \
    --install-extension coolbear.systemd-unit-file \
    --install-extension usernamehw.remove-empty-lines \
    --install-extension batisteo.vscode-django \
    --install-extension seanwu.vscode-qt-for-python \
    --install-extension ms-python.python \
    --install-extension devmike.mikrotik-routeros-script

# ----------------------

# Python3 y django
pip3 install --upgrade Django==2.1
pip3 install Pillow
pip3 install --upgrade pip
# ---------------------------------------

# con esto funciona el qDebug para QT5
cat <<EOF >>/etc/xdg/QtProject/qtlogging.ini
[Rules]
*.debug=true
qt.*.debug=false
EOF
# --------------------------------------
