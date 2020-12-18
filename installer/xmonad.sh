# repositorio del compilador de hashkel
sudo yum -y install wget
sudo wget https://copr.fedorainfracloud.org/coprs/petersen/ghc-8.6.5/repo/epel-7/petersen-ghc-8.6.5-epel-7.repo -P /etc/yum.repos.d/
sudo yum -y install ghc cabal-install

sudo yum -y install libXrandr-devel libXScrnSaver-devel alsa-lib-devel libXpm-devel

# si se quere reinstalar borrar las carpetas ~/.cabal y ~/.ghc
cabal update
cabal install xmonad
cabal install xmonad-contrib

# la dependecia cryptonite-0.27 de xmobar tiene un conflicto de compilacion, con la
# opcion '-f -use_target_attributes' funciona, se tiene que instalar antes que xmobar para que funcione.
cabal install -f -use_target_attributes cryptonite
cabal install --fwith_xft xmobar

# c2hs es una dependencia de xmonad-extras, se tiene que instalar con
# new-install, con esto sobre escribimos algunos symolic-links, para que no
# de conflicto al instalar xmonad-extras.
cabal new-install c2hs
cabal install xmonad-extras


echo "exec ~/.cabal/bin/xmonad" > ~/.xinitrc # Inicio de xmonad por defecto

# feh es necesario para agregar wallpapers
sudo yum -y --nogpg install https://mirror.ghettoforge.org/distributions/gf/gf-release-latest.gf.el7.noarch.rpm
sudo yum -y install feh
