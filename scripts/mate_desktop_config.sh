path=$(dirname $(realpath "$0"))

# desabilitar animacion al minimizar las ventanas
gsettings set org.mate.interface enable-animations false


# desabilita el movimiento de ventanas con el modificador <Alt>
gsettings set org.mate.Marco.general mouse-button-modifier ''


# shortcuts
gsettings set org.mate.Marco.global-keybindings switch-to-workspace-left '<Control><Mod4>J'
gsettings set org.mate.Marco.global-keybindings switch-to-workspace-right '<Control><Mod4>K'

gsettings set org.mate.Marco.global-keybindings switch-to-workspace-1 '<Mod4>1'
gsettings set org.mate.Marco.global-keybindings switch-to-workspace-2 '<Mod4>2'
gsettings set org.mate.Marco.global-keybindings switch-to-workspace-3 '<Mod4>3'
gsettings set org.mate.Marco.global-keybindings switch-to-workspace-4 '<Mod4>4'

gsettings set org.mate.Marco.window-keybindings move-to-workspace-1 '<Shift><Mod4>1'
gsettings set org.mate.Marco.window-keybindings move-to-workspace-2 '<Shift><Mod4>2'
gsettings set org.mate.Marco.window-keybindings move-to-workspace-3 '<Shift><Mod4>3'
gsettings set org.mate.Marco.window-keybindings move-to-workspace-4 '<Shift><Mod4>4'

gsettings set org.mate.Marco.window-keybindings close '<Shift><Mod4>c'
gsettings set org.mate.Marco.window-keybindings maximize '<Shift><Mod4>f'

add_custom_key() {
    dconf write /org/mate/desktop/keybindings/custom$1/name \'$2\'
    dconf write /org/mate/desktop/keybindings/custom$1/binding \'$3\'
    dconf write /org/mate/desktop/keybindings/custom$1/action \'"$4"\'
}

add_custom_key 0 'app_finder' '<Mod4>o' "sh $path/appfinder.sh"
add_custom_key 1 'gnome_terminal' '<Shift><Mod4>Return' 'gnome-terminal'
add_custom_key 2 'chrome' '<Mod4>g' 'google-chrome-stable'
