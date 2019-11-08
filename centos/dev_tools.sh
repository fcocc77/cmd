user=$1
gitpass=$2

# Configuraciones
su $user -c git config --global alias.lod 'log --oneline -10'
su $user -c git config --global alias.auto '!git add . && git commit -m "..." && git push'
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
su $user -c code \
--install-extension ms-vscode.cpptools \
--install-extension ritwickdey.live-sass \
--install-extension syler.sass-indented \
--install-extension azemoh.theme-onedark \
--install-extension foxundermoon.shell-format \
--install-extension jeff-hykin.better-shellscript-sytax \
--install-extension vscode-icons-team.vscode-icons \
--install-extension coolbear.systemd-unit-file \
--install-extension usernamehw.remove-empty-lines \
--install-extension batisteo.vscode-django \
--install-extension seanwu.vscode-qt-for-python \
--install-extension ms-python.python
# ----------------------

# Python3 y django
pip3 install --upgrade Django==2.1
pip3 install Pillow
pip3 install --upgrade pip
# ---------------------------------------

# con esto funciona el qDebug para QT5
cat << EOF >> /etc/xdg/QtProject/qtlogging.ini
[Rules]
*.debug=true
qt.*.debug=false
EOF
# --------------------------------------