
user='/home/pancho'

# Oh-my-zsh
export ZSH="$user/.oh-my-zsh"
ZSH_THEME='agnoster'
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
ZSH_DISABLE_COMPFIX="true"
source $ZSH/oh-my-zsh.sh

# Alias
alias vina="cd $user/Documents/GitHub/videovina"
alias vinarender="cd $user/Documents/GitHub/vinarender"
alias natron="cd $user/Documents/GitHub/natron_utils"
alias juno="cd $user/Documents/GitHub/juno"
alias github="cd $user/Documents/GitHub"
alias cmd="cd $user/Documents/GitHub/cmd"
alias bashrc="vim /root/.bashrc"
alias desk="cd /root/Desktop"
alias natron_plugins="cd /usr/share/Natron/Plugins"
