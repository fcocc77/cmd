user="pancho"

yum -y install git

# -------------------
git config --global user.email "fcocc77@gmail.com"
git config --global user.name "Francisco Contreras"
# ignora los permisos de archivos chmod xxx
# git config core.filemode false
# --------------------------------

# guarda el usuario y password permanentemente
git config credential.helper store