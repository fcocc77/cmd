# este archivo se tiene que ejecutar en cada usuario

# source code: https://github.com/ohmyzsh/ohmyzsh

cd /tmp

yum -y install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# fuentes necesarias
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
sh ./install.sh
rm -rf fonts

# autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Colores para la sintaxis
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# usar el zsh de forma predeterminada
chsh -s /bin/zsh
