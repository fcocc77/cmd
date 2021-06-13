path=$(dirname $(realpath "$0"))

# desabilitar animacion al minimizar las ventanas
gsettings set org.mate.interface enable-animations false


# desabilita el movimiento de ventanas con el modificador <Alt>
gsettings set org.mate.Marco.general mouse-button-modifier ''

# centra la ventana al inicio
gsettings set org.mate.Marco.general center-new-windows true

# layout de panel
python3 $path/panel_setup.py
sudo cp $path/panels.layout /usr/share/mate-panel/layouts/panels.layout
gsettings set org.mate.panel default-layout 'panels'
mate-panel --replace --reset


# shortcuts
gsettings set org.mate.Marco.global-keybindings switch-to-workspace-1 '<Mod4>1'
gsettings set org.mate.Marco.global-keybindings switch-to-workspace-2 '<Mod4>2'
gsettings set org.mate.Marco.global-keybindings switch-to-workspace-3 '<Mod4>3'
gsettings set org.mate.Marco.global-keybindings switch-to-workspace-4 '<Mod4>4'

gsettings set org.mate.Marco.window-keybindings move-to-workspace-1 '<Shift><Mod4>1'
gsettings set org.mate.Marco.window-keybindings move-to-workspace-2 '<Shift><Mod4>2'
gsettings set org.mate.Marco.window-keybindings move-to-workspace-3 '<Shift><Mod4>3'
gsettings set org.mate.Marco.window-keybindings move-to-workspace-4 '<Shift><Mod4>4'

gsettings set org.mate.Marco.window-keybindings move-to-side-e '<Mod4><Alt>l' # right
gsettings set org.mate.Marco.window-keybindings move-to-side-s '<Mod4><Alt>j' # down
gsettings set org.mate.Marco.window-keybindings move-to-side-w '<Mod4><Alt>h' # left
gsettings set org.mate.Marco.window-keybindings move-to-side-n '<Mod4><Alt>k' # up
gsettings set org.mate.Marco.window-keybindings move-to-center '<Mod4><Alt>semicolon' #semicolon es ;

gsettings set org.mate.Marco.global-keybindings cycle-windows '<Mod4>j'
gsettings set org.mate.Marco.window-keybindings toggle-maximized '<Mod4>f'

gsettings set org.mate.Marco.window-keybindings minimize '<Mod4>h' # hide
gsettings set org.mate.Marco.window-keybindings close '<Shift><Mod4>c'

add_custom_key() {
    dconf write /org/mate/desktop/keybindings/custom$1/name \'$2\'
    dconf write /org/mate/desktop/keybindings/custom$1/binding \'$3\'
    dconf write /org/mate/desktop/keybindings/custom$1/action \'"$4"\'
}

add_custom_key 0 'app_finder' '<Mod4>o' "sh $path/../scripts/appfinder.sh mate"
add_custom_key 1 'gnome_terminal' '<Shift><Mod4>Return' 'mate-terminal'
add_custom_key 2 'chrome' '<Mod4>g' 'google-chrome-stable'
add_custom_key 3 'calc' '<Mod4>c' 'mate-calc'
add_custom_key 4 'logout' '<Shift><Mod4>q' 'mate-session-save --logout'
add_custom_key 5 'tiling' '<Mod4>space' "python3 $path/../python_scripts/tiling.py"
add_custom_key 6 'pluma' '<Mod4>e' 'pluma'

add_custom_key 7 'move_left' '<Control><Mod4>j' "python3 $path/../python_scripts/desktop_actions.py workspace_move_left"
add_custom_key 8 'move_right' '<Control><Mod4>k' "python3 $path/../python_scripts/desktop_actions.py workspace_move_right"
