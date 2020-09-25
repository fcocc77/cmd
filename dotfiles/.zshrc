user='/home/pancho'

# Oh-my-zsh
export ZSH="$user/.oh-my-zsh"
ZSH_THEME='agnoster'
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
ZSH_DISABLE_COMPFIX="true"
source $ZSH/oh-my-zsh.sh

# muestra solo el directorio actual
prompt_dir() {
    prompt_segment blue black '%c'
}

# color del usuario
prompt_context() {
    local user=$(whoami)
    prompt_segment cyan black "$user"
}

# Alias
alias vina="cd $user/Documents/develop/videovina"
alias vinarender="cd $user/Documents/develop/vinarender"
alias natron="cd $user/Documents/develop/natron_utils"
alias juno="cd $user/Documents/develop/juno"
alias develop="cd $user/Documents/develop"
alias myconf="cd $user/Documents/develop/my-config"
alias bashrc="vim /root/.bashrc"
alias desk="cd /root/Desktop"
alias natron_plugins="cd /usr/share/Natron/Plugins"
