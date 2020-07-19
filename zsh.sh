# source code: https://github.com/ohmyzsh/ohmyzsh

function install() {
    cd /tmp

    yum -y install tmux2
    yum -y install zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

    # fuentes necesarias
    git clone https://github.com/powerline/fonts.git --depth=1
    cd fonts
    sh ./install.sh
    rm -rf fonts

    # autosuggestions
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

    # Colores para la sintaxis
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

    # usar el zsh de forma predeterminada
    chsh -s /bin/zsh
}

function zshrc() {
    # cambia el tema
    theme='robbyrussell'
    theme='agnoster'

    userdir=$1

    zshrc="$userdir/.zshrc"
    rm $zshrc

    # zsh configuraciones
    echo "export ZSH=\"/home/pancho/.oh-my-zsh\"" >>$zshrc
    echo "ZSH_THEME='$theme'" >>$zshrc
    echo "plugins=(git zsh-autosuggestions zsh-syntax-highlighting)" >>$zshrc
    echo "ZSH_DISABLE_COMPFIX=\"true\"" >>$zshrc
    echo "source \$ZSH/oh-my-zsh.sh" >>$zshrc
    # ----------------------

    # alias
    user='pancho'
    github="cd /home/$user/Documents/GitHub"

    echo alias vina=\"$github/videovina\" >>$zshrc
    echo alias vinarender=\"$github/vinarender\" >>$zshrc
    echo alias natron=\"$github/natron_utils\" >>$zshrc
    echo alias juno=\"$github/juno\" >>$zshrc
    echo alias github=\"$github\" >>$zshrc
    echo alias cmd=\"$github/cmd\" >>$zshrc

    echo alias bashrc=\"vim ~/.bashrc\" >>$zshrc
    echo alias desk=\"cd ~/Desktop\" >>$zshrc
    echo alias natron_plugins=\"cd /usr/share/Natron/Plugins\" >>$zshrc
    # ---------------------
}

zshrc '/home/pancho'
zshrc '/root'
