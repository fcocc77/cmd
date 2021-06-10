# usar terminal 'gnome-terminal' que soporta 24 bit de colores

sudo dnf -y remove vim-common vim-enhanced
sudo dnf -y install gcc make ncurses ncurses-devel
sudo dnf -y install xorg-x11-server-devel libX11-devel libXt-devel

sudo dnf install builddep

cd /tmp
git clone https://github.com/vim/vim.git
cd vim

# '--with-x' y ' --enable-gui' son para que vim se comunique con X11 y con eso
# poder copiear desde vim hacia afuera con 'clipboard'
./configure --with-features=huge --enable-pythoninterp --with-x --enable-gui
make -j4

sudo make install

# instalacion de vim-plug, sirve para poder instalar mas facilmente plugins en vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# copia las nerd-fonts a la carpeta compartida de fuentes:
# cp ~/.vim/plugged/nerd-fonts/patched-fonts/*/**/*.ttf ~/.local/share/fonts
