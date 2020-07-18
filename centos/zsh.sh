yum -y install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# cambia el tema
user="pancho"
sed -i "s|robbyrussell|agnoster|g" /home/$user/.zshrc
