yum -y install code

# Extenciones vscode
su $USER -c "code \
    --install-extension ms-vscode.cpptools \
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
    --install-extension devmike.mikrotik-routeros-script \
    --install-extension xshrim.txt-syntax \
    --install-extension zhuangtongfa.material-theme"
