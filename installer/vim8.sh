# usar terminal 'gnome-terminal' que soporta 24 bit de colores

yum -y remove vim-minimal vim-common vim-enhanced sudo
yum install gcc make ncurses ncurses-devel

cd /tmp
git clone https://github.com/vim/vim.git
cd vim

./configure --with-features=huge --enable-pythoninterp
make -j4

make install
