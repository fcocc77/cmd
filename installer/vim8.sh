# usar terminal 'gnome-terminal' que soporta 24 bit de colores

sudo yum -y remove vim-minimal vim-common vim-enhanced sudo
sudo yum install gcc make ncurses ncurses-devel

cd /tmp
git clone https://github.com/vim/vim.git
cd vim

./configure --with-features=huge --enable-pythoninterp
make -j4

make install

# instalacion de vim-plug, sirve para poder instalar mas facilmente plugins en vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# instala los plugins que estan en '.vimrc'
vim +PlugInstall
