
yum -y groupinstall "MATE Desktop"



# Escritorio MATTE
echo "exec /usr/bin/mate-session" >> ~/.xinitrc # Inicio de MATE por defecto
su $user -c "echo exec /usr/bin/mate-session >> ~/.xinitrc"
# ------------------------------------