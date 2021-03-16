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
alias nitrogen="cd $user/Documents/develop/nitrogen"
alias juno="cd $user/Documents/develop/juno"
alias develop="cd $user/Documents/develop"
alias myconf="cd $user/Documents/develop/my-config"
alias vinacomp="cd $user/Documents/develop/vinacomp"
alias bashrc="vim /root/.bashrc"
alias desk="cd /root/Desktop"
alias natron_plugins="cd /usr/share/Natron/Plugins"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# OneDark theme para FZF
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color=dark
--color=fg:#abb2bf,bg:#252a31,hl:#56b6c2,fg+:#abb2bf,bg+:#2c313a,hl+:#e06c75
--color=info:#61afef,prompt:#98c379,pointer:#e5c07b
'
