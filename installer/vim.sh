# instalacion de vim-plug, sirve para poder instalar mas facilmente plugins en vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# instala los plugins que estan en '.vimrc'
vim +PlugInstall
