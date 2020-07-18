# source code: https://github.com/ohmyzsh/ohmyzsh

# yum -y install zsh
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# cambia el tema
user="pancho"
zshrc="/home/$user/.zshrc"
# sed -i "s|robbyrussell|agnoster|g"

echo "
export ZSH="/home/pancho/.oh-my-zsh"
ZSH_THEME="agnoster"
plugins=(git)
source $ZSH/oh-my-zsh.sh" >$zshrc

# usar el zsh de forma predeterminada
# chsh -s /bin/zsh
